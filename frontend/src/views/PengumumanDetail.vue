<template>
  <div>
    <PageHeader
      :title="pengumuman?.judul || 'Detail Pengumuman'"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'Pengumuman', link: '/pengumuman' },
        { label: pengumuman?.judul || 'Detail', link: '#' },
      ]"
    />

    <!-- Wrapper (global layout dari main.css, sama dengan layanan) -->
    <div class="page-container">
      <!-- Error -->
      <div v-if="error" class="page-main">
        <div class="page-content">
          <p class="text-red-600">Terjadi kesalahan: {{ error }}</p>
          <p class="text-sm text-gray-600">Silakan refresh halaman atau periksa koneksi/server.</p>
        </div>
      </div>

      <!-- Konten Utama -->
      <div v-else-if="!loading && pengumuman" class="page-main">
        <article class="page-content">
          <!-- Thumbnail -->
          <img :src="thumbnailSrc" alt="Thumbnail Pengumuman" class="page-thumbnail" />

          <!-- Tanggal -->
          <div class="page-meta">
            {{
              new Date(pengumuman.created_at).toLocaleDateString('id-ID', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
              })
            }}
          </div>

          <!-- Tanggal pelaksanaan (BARU) -->
          <div v-if="pengumuman.tgl_pelaksanaan" class="page-meta mt-1 text-green-700 font-medium">
            📅 Pelaksanaan:
            {{
              new Date(pengumuman.tgl_pelaksanaan).toLocaleDateString('id-ID', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
              })
            }}
          </div>

          <!-- Isi -->
          <div v-html="pengumuman.isi" class="page-body"></div>
        </article>
      </div>

      <!-- Sidebar -->
      <aside class="page-sidebar" v-if="!loading && !error">
        <SidebarPengumuman />
      </aside>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="page-loading-placeholder">Memuat detail pengumuman...</div>

    <!-- Not Found -->
    <div v-if="!loading && !pengumuman && !error" class="text-center py-10 text-gray-500">
      Pengumuman tidak ditemukan.
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch, computed } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'

import PageHeader from '@/components/PageHeader.vue'
import SidebarPengumuman from '@/components/SidebarPengumuman.vue'

const route = useRoute()
const loading = ref(true)
const pengumuman = ref(null)
const error = ref(null)

// Fetch detail pengumuman
const fetchDetail = async (slug) => {
  loading.value = true
  error.value = null
  try {
    const res = await axios.get(`/api/pengumuman/${slug}`)
    pengumuman.value = res.data.data
  } catch (err) {
    error.value = 'Gagal memuat detail pengumuman.'
  } finally {
    loading.value = false
  }
}

onMounted(() => fetchDetail(route.params.slug))

watch(
  () => route.params.slug,
  (slug) => fetchDetail(slug),
)

const thumbnailSrc = computed(() => {
  return pengumuman.value?.gambar
    ? `/storage/${pengumuman.value.gambar}`
    : '/images/default-pengumuman.jpg'
})
</script>

<style scoped>
/* Mengikuti style halaman layanan: hanya fix gambar di artikel */
.page-content img {
  max-width: 100%;
  height: auto;
  border-radius: 12px;
  margin: 1.5rem 0;
}
</style>
