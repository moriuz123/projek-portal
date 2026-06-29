<template>
  <aside class="space-y-6">
    <!-- Komponen Banner -->
    <BannerSlider />

    <!-- Komponen NewsTabs -->
    <NewsTabs :latestNews="latestNews" :popularNews="popularNews" />
  </aside>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from '@/utils/api'
import BannerSlider from './BannerSlider.vue'
import NewsTabs from './NewsTabs.vue'

const latestNews = ref([])
const popularNews = ref([])

onMounted(async () => {
  try {
    const latestRes = await axios.get('/api/berita?sort=latest&limit=5')
    latestNews.value = latestRes.data || []

    const popularRes = await axios.get('/api/berita?sort=popular&limit=5')
    popularNews.value = popularRes.data || []
  } catch (err) {
    console.error('Gagal load berita sidebar:', err)
  }
})
</script>
