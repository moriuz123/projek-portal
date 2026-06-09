<template>
  <aside class="space-y-6">
    <!-- Layanan Terbaru -->
    <BannerSlider />
    <section class="sidebar-section bg-white shadow-md rounded-lg p-4">
      <h3 class="text-lg font-semibold text-gray-800 border-b pb-2 mb-4">Layanan Terbaru</h3>

      <div v-if="layananList.length === 0" class="text-gray-500 text-sm">Tidak ada layanan.</div>

      <div v-for="item in layananList" :key="item.slug" class="flex gap-3 mb-4">
        <!-- Thumbnail -->
        <img
          :src="item.cover ? item.cover : '/images/default-layanan.jpg'"
          class="w-20 h-16 object-cover rounded"
          alt="thumb"
        />

        <div class="flex-1">
          <router-link
            :to="`/layanan/${item.slug}`"
            class="font-medium text-gray-800 hover:text-green-600 line-clamp-2"
          >
            {{ item.judul }}
          </router-link>

          <p class="text-xs text-gray-500 mt-1">
            {{
              new Date(item.created_at).toLocaleDateString('id-ID', {
                day: 'numeric',
                month: 'short',
                year: 'numeric',
              })
            }}
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

const layananList = ref([])

onMounted(async () => {
  try {
    const res = await axios.get('/api/layanan?limit=5')
    layananList.value = res.data || []
  } catch (e) {
    console.error('Gagal memuat layanan terbaru:', e)
  }
})
</script>

<style scoped>
.sidebar-section {
  border: 1px solid #e5e7eb;
}
</style>
