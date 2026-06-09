<template>
  <div>
    <!-- ✅ Header -->
    <PageHeader
      :title="store.beritaDetail?.judul || 'Detail Berita'"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'Berita', link: '/berita' },
        { label: store.beritaDetail?.judul || 'Detail', link: '#' },
      ]"
    />

    <!-- ✅ Konten Utama + Sidebar -->
    <div class="page-container">
      <div v-if="!store.loading && store.beritaDetail" class="page-main">
        <article class="bg-white shadow-md rounded-lg p-6 prose max-w-none">
          <!-- Thumbnail -->
          <img
            v-if="store.beritaDetail.image"
            :src="store.beritaDetail.image"
            alt="Thumbnail Berita"
            class="w-full h-80 object-cover rounded mb-6"
          />

          <!-- Tanggal & Views -->
          <div class="flex items-center justify-between text-sm text-gray-500 mb-4">
            <p>
              {{
                new Date(store.beritaDetail.tanggal_publish).toLocaleDateString('id-ID', {
                  weekday: 'long',
                  year: 'numeric',
                  month: 'long',
                  day: 'numeric',
                })
              }}
            </p>
            <p class="text-gray-600">👁️ Dilihat: {{ store.beritaDetail.views ?? 0 }} kali</p>
          </div>

          <!-- Isi Konten -->
          <div v-html="store.beritaDetail.konten" class="leading-relaxed text-gray-700"></div>
        </article>
      </div>

      <!-- ✅ Sidebar -->
      <aside class="page-sidebar" v-if="!store.loading">
        <SidebarDetilNews />
      </aside>
    </div>

    <!-- ✅ Loading State -->
    <div v-if="store.loading" class="text-center py-20 text-gray-500">Memuat detail berita...</div>
  </div>
</template>

<script setup>
import { onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useBeritaStore } from '../stores/useBeritaStore'
import SidebarDetilNews from '../components/SidebarDetilNews.vue'
import PageHeader from '../components/PageHeader.vue'

const route = useRoute()
const store = useBeritaStore()

// Fungsi untuk load berita berdasarkan slug
const loadBerita = (slug) => {
  if (slug) store.fetchBeritaDetail(slug)
}

// Jalankan saat pertama kali halaman dibuka
onMounted(() => loadBerita(route.params.slug))

// Jalankan ulang bila slug berubah
watch(
  () => route.params.slug,
  (slug) => loadBerita(slug),
)
</script>
