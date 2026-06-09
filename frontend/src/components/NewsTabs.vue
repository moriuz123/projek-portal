<template>
  <div class="news-tabs bg-white rounded-2xl shadow-md p-4 border border-gray-100 font-poppins">
    <!-- 🔹 Tabs Header -->
    <div class="tabs-header flex border-b border-gray-200 mb-4">
      <button
        class="tab-button flex-1 py-2 text-center font-semibold tracking-wide"
        :class="activeTab === 'latest' ? 'active-tab' : 'inactive-tab'"
        @click="activeTab = 'latest'"
      >
        Terbaru
      </button>

      <button
        class="tab-button flex-1 py-2 text-center font-semibold tracking-wide"
        :class="activeTab === 'popular' ? 'active-tab' : 'inactive-tab'"
        @click="activeTab = 'popular'"
      >
        Terpopuler
      </button>
    </div>

    <!-- 🔹 Loading -->
    <div v-if="store.loading" class="text-center py-6 text-gray-500 italic">Memuat berita...</div>

    <!-- 🔹 Daftar Berita -->
    <ul v-else class="space-y-4">
      <li
        v-for="item in displayedNews"
        :key="item.id"
        class="news-item flex gap-3 items-start border border-gray-100 rounded-lg p-3 bg-gradient-to-r from-green-50 to-emerald-50 hover:shadow-md hover:border-green-200 transition-all duration-300"
      >
        <!-- Thumbnail -->
        <img
          :src="resolveThumbnail(item.thumbnail)"
          alt="thumbnail"
          class="news-thumb w-16 h-16 object-cover rounded-md flex-shrink-0 ring-1 ring-green-200"
        />

        <!-- Judul dan Tanggal -->
        <div class="flex-1">
          <RouterLink
            :to="`/berita/${item.slug}`"
            class="news-title block font-semibold text-sm text-[#001D39] hover:text-green-700 leading-snug"
          >
            {{ item.judul }}
          </RouterLink>
          <p class="news-date text-xs text-gray-600 mt-1">
            {{ formatDate(item.tanggal_publish) }}
          </p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useBeritaStore } from '@/stores/useBeritaStore'

const store = useBeritaStore()
const activeTab = ref('latest')

// ✅ Fungsi untuk memastikan path thumbnail benar
const resolveThumbnail = (img) => {
  if (!img) return '/images/default-thumbnail.jpg'
  return img.includes('/storage') ? img : `/storage/${img}`
}

// ✅ Format tanggal lokal
const formatDate = (dateStr) => {
  if (!dateStr) return ''
  return new Date(dateStr).toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

// ✅ Tentukan daftar berita aktif
const displayedNews = computed(() => (activeTab.value === 'latest' ? store.latest : store.popular))

// ✅ Ambil data hanya sekali saat pertama kali
onMounted(async () => {
  if (store.latest.length === 0) await store.fetchLatest()
  if (store.popular.length === 0) await store.fetchPopular()
})
</script>
