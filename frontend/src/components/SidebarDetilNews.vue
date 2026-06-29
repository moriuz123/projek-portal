<template>
  <aside class="sidebar-news space-y-6">
    <!-- Banner slider -->
    <section class="sidebar-section">
      <BannerSlider />
    </section>

    <!-- Tabs: Berita Terbaru & Populer -->
    <section class="sidebar-section">
      <NewsTabs :latestNews="latestNews" :popularNews="popularNews" />
    </section>
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
    const [latestRes, popularRes] = await Promise.all([
      axios.get('/api/berita?sort=latest&limit=5'),
      axios.get('/api/berita?sort=popular&limit=5'),
    ])

    latestNews.value = latestRes.data || []
    popularNews.value = popularRes.data || []
  } catch (err) {
    console.error('Gagal memuat berita sidebar:', err)
  }
})
</script>
