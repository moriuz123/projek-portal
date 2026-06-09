<template>
  <div>
    <!-- ✅ Page Header -->
    <PageHeader
      :title="`Berita Kategori: ${kategoriSlug}`"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'Berita', link: '/berita' },
        { label: kategoriSlug, link: `/berita/kategori/${kategoriSlug}` },
      ]"
    />

    <!-- ✅ Layout konten & sidebar -->
    <div class="page-container">
      <!-- Konten utama -->
      <main class="page-main">
        <!-- Loading state -->
        <div v-if="store.loading" class="page-loading-placeholder">Memuat berita...</div>

        <!-- Jika kosong -->
        <div v-else-if="store.beritas.length === 0" class="text-gray-500 text-center py-8">
          Tidak ada berita di kategori ini.
        </div>

        <!-- ✅ Daftar Berita -->
        <div v-else class="news-grid">
          <NewsCard
            v-for="berita in store.beritas"
            :key="berita.id"
            :judul="berita.judul"
            :slug="berita.slug"
            :thumbnail="
              berita.image?.includes('/storage') ? berita.image : `/storage/${berita.image}`
            "
            :konten="berita.konten"
            :tanggal="berita.tanggal_publish"
            :kategori="berita.kategori?.nama || kategoriSlug"
            :excerpt="berita.excerpt || berita.konten.slice(0, 120) + '...'"
          />
        </div>
      </main>

      <!-- ✅ Sidebar -->
      <aside class="page-sidebar">
        <SidebarNews />
      </aside>
    </div>
  </div>
</template>

<script setup>
import { onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'
import { useBeritaStore } from '@/stores/useBeritaStore'
import PageHeader from '@/components/PageHeader.vue'
import NewsCard from '@/components/NewsCard.vue'
import SidebarNews from '@/components/SidebarNews.vue'

const route = useRoute()
const store = useBeritaStore()
const kategoriSlug = route.params.slug

// Ambil berita berdasarkan kategori
const fetchKategoriBerita = async (slug) => {
  store.loading = true
  try {
    const res = await axios.get(`/api/berita/kategori/${slug}`)
    store.beritas = res.data.data || res.data || []
  } catch (err) {
    console.error('Gagal memuat berita kategori:', err)
    store.error = err.response?.data?.message || 'Gagal memuat berita kategori'
  } finally {
    store.loading = false
  }
}

// Fetch pertama kali
onMounted(() => {
  fetchKategoriBerita(kategoriSlug)
})

// Watch saat slug berubah
watch(
  () => route.params.slug,
  (newSlug) => {
    if (newSlug) fetchKategoriBerita(newSlug)
  },
)
</script>
