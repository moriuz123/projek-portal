<template>
  <aside class="space-y-6">
    <!-- Banner -->
    <BannerSlider />

    <!-- Agenda Terbaru -->
    <section class="sidebar-section bg-white shadow-md rounded-lg p-4">
      <h3 class="text-lg font-semibold text-gray-800 border-b pb-2 mb-4">Agenda Terbaru</h3>

      <div v-if="items.length === 0" class="text-gray-500 text-sm">Tidak ada agenda.</div>

      <div v-for="item in items" :key="item.id" class="flex gap-3 mb-4">
        <!-- Thumbnail tanggal -->
        <div
          class="w-16 h-16 bg-blue-600 text-white flex flex-col items-center justify-center rounded-md shadow"
        >
          <span class="text-xs">
            {{ formatMonth(item.tanggal_mulai) }}
          </span>
          <span class="text-lg font-bold">
            {{ formatDay(item.tanggal_mulai) }}
          </span>
        </div>

        <!-- Judul -->
        <div class="flex-1">
          <router-link
            :to="`/agenda/${item.id}`"
            class="font-medium text-gray-800 hover:text-blue-600 line-clamp-2"
          >
            {{ item.judul }}
          </router-link>

          <p class="text-xs text-gray-500 mt-1">
            {{ formatFullDate(item.tanggal_mulai) }}
          </p>
        </div>
      </div>
    </section>
  </aside>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import BannerSlider from './BannerSlider.vue'

const items = ref([])

onMounted(async () => {
  try {
    const res = await axios.get('/api/agendas?limit=5')
    items.value = res.data?.data ?? []
  } catch (e) {
    console.error('Gagal memuat sidebar agenda:', e)
  }
})

function formatMonth(date) {
  return new Intl.DateTimeFormat('id-ID', { month: 'short' }).format(new Date(date)).toUpperCase()
}

function formatDay(date) {
  return new Date(date).getDate()
}

function formatFullDate(date) {
  return new Intl.DateTimeFormat('id-ID', {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  }).format(new Date(date))
}
</script>

<style scoped>
.sidebar-section {
  border: 1px solid #e5e7eb;
}
</style>
