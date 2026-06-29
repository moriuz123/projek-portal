<template>
  <div>
    <!-- ✅ Page Header -->
    <PageHeader
      title="Berita"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'Berita', link: '/berita' },
      ]"
    />

    <!-- ✅ Layout konten & sidebar -->
    <div class="max-w-screen-xl mx-auto px-4 py-8 lg:flex lg:space-x-8">
      <!-- Konten utama -->
      <div class="lg:w-3/4">
        <!-- Loading state -->
        <div v-if="store.loading" class="text-gray-500 text-center py-8">Memuat berita...</div>

        <!-- Jika kosong -->
        <div v-else-if="store.beritas.length === 0" class="text-gray-500 text-center py-8">
          Tidak ada berita tersedia.
        </div>

        <!-- ✅ Daftar Berita -->
        <div v-else class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <NewsCard
            v-for="berita in store.beritas"
            :key="berita.id"
            :judul="berita.judul || 'Tidak ada judul'"
            :slug="berita.slug || ''"
            :thumbnail="berita.image || berita.thumbnail || ''"
            :tanggal="berita.tanggal_publish || berita.tanggal || 'Tanggal tidak tersedia'"
            :kategori="berita.kategori?.nama || berita.kategori_nama || 'Umum'"
            :excerpt="
              berita.excerpt ||
              (berita.konten
                ? stripHtml(berita.konten).slice(0, 120) + '...'
                : 'Tidak ada ringkasan')
            "
          />
        </div>
      </div>

      <!-- ✅ Sidebar -->
      <aside class="lg:w-1/4 mt-8 lg:mt-0">
        <SidebarNews />
      </aside>
    </div>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import axios from '@/utils/api'
import { useBeritaStore } from '@/stores/useBeritaStore'
import PageHeader from '@/components/PageHeader.vue'
import NewsCard from '@/components/NewsCard.vue'
import SidebarNews from '@/components/SidebarNews.vue'

const store = useBeritaStore()

// 🔹 Fungsi bersihkan HTML
const stripHtml = (html) => {
  if (!html) return ''
  const tmp = document.createElement('DIV')
  tmp.innerHTML = html
  return tmp.textContent || tmp.innerText || ''
}

// 🔹 Ambil semua berita
const fetchBerita = async () => {
  store.loading = true
  try {
    const res = await axios.get('/api/berita')
    store.beritas = res.data.data || res.data || []
  } catch (err) {
    console.error('Gagal memuat berita:', err)
    store.error = err.response?.data?.message || 'Gagal memuat berita'
  } finally {
    store.loading = false
  }
}

onMounted(() => {
  fetchBerita()
})
</script>
