<template>
  <aside class="sidebar-news space-y-6">
    <!-- Banner -->
    <section class="sidebar-section">
      <BannerSlider />
    </section>

    <!-- Pengumuman Terbaru -->
    <section class="sidebar-section">
      <h3 class="text-lg font-semibold text-gray-700 mb-4">Pengumuman Terbaru</h3>
      <ul class="space-y-4">
        <li v-for="item in latestPengumuman" :key="item.id" class="flex items-start gap-3">
          <!-- Thumbnail (default jika kosong) -->
          <img
            :src="item.gambar ? `/storage/${item.gambar}` : '/images/default-pengumuman.jpg'"
            alt="Thumbnail"
            class="w-16 h-16 object-cover rounded"
          />

          <!-- Judul & Tanggal -->
          <div class="flex-1">
            <router-link
              :to="`/pengumuman/${item.slug}`"
              class="block text-gray-700 hover:text-green-600 font-medium"
            >
              {{ item.judul }}
            </router-link>
            <p class="text-xs text-gray-400">
              {{ formatDate(item.created_at) }}
            </p>
          </div>
        </li>
      </ul>
    </section>
  </aside>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import BannerSlider from './BannerSlider.vue'

const latestPengumuman = ref([])

const formatDate = (date) => {
  if (!date) return ''
  return new Date(date).toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

onMounted(async () => {
  try {
    const res = await axios.get('/api/pengumuman?sort=latest&limit=5')
    latestPengumuman.value = res.data.data || []
  } catch (err) {
    console.error('Gagal memuat sidebar pengumuman:', err)
  }
})
</script>

<style scoped>
.sidebar-news {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.sidebar-section {
  background-color: white;
  padding: 1rem;
  border-radius: 12px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);
}
</style>
