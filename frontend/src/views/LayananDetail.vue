<template>
  <div>
    <!-- Header -->
    <PageHeader
      :title="layanan?.judul || 'Detail Layanan'"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'Layanan', link: '/layanan' },
        { label: layanan?.judul || 'Detail', link: '#' },
      ]"
    />

    <!-- Wrapper (global layout dari main.css) -->
    <div class="page-container">
      <!-- Konten Utama -->
      <div v-if="!loading && layanan" class="page-main">
        <article class="page-content">
          <!-- Cover -->
          <img
            v-if="layanan.cover"
            :src="layanan.cover"
            alt="Cover Layanan"
            class="page-thumbnail"
          />

          <!-- Deskripsi -->
          <div v-html="layanan.deskripsi" class="page-body"></div>

          <!-- Kontak -->
          <div v-if="layanan.kontak" class="mt-6 bg-blue-50 p-4 rounded-lg border border-blue-200">
            <h3 class="text-lg font-semibold text-blue-700 mb-1">Kontak</h3>
            <p class="text-gray-600">{{ layanan.kontak }}</p>
          </div>

          <!-- Unit Pelaksana -->
          <div
            v-if="layanan.unit_pelaksana"
            class="mt-4 bg-green-50 p-4 rounded-lg border border-green-200"
          >
            <h3 class="text-lg font-semibold text-green-700 mb-1">Unit Pelaksana</h3>
            <p class="text-gray-600">{{ layanan.unit_pelaksana }}</p>
          </div>
        </article>
      </div>

      <!-- Sidebar -->
      <aside class="page-sidebar" v-if="!loading">
        <SidebarLayanan />
      </aside>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="page-loading-placeholder">Memuat detail layanan...</div>

    <!-- Not Found -->
    <div v-if="!loading && !layanan" class="text-center py-10 text-gray-500">
      Data layanan tidak ditemukan.
    </div>
  </div>
</template>

<script setup>
import { onMounted, computed, watch } from 'vue'
import { useRoute } from 'vue-router'
import PageHeader from '@/components/PageHeader.vue'
import SidebarLayanan from '@/components/SidebarLayanan.vue'
import { useLayananStore } from '@/stores/layanan'

const route = useRoute()
const layananStore = useLayananStore()

const layanan = computed(() => layananStore.layananDetail)
const loading = computed(() => layananStore.loading)

// Load pertama saat halaman dibuka
onMounted(() => {
  layananStore.fetchLayananDetail(route.params.slug)
})

// Load ulang ketika slug berubah
watch(
  () => route.params.slug,
  (newSlug) => {
    layananStore.fetchLayananDetail(newSlug)
  },
)
</script>

<style scoped>
/* Tidak menambah aturan baru, hanya fix untuk gambar di dalam article */
.page-content img {
  max-width: 100%;
  height: auto;
  border-radius: 12px;
  margin: 1.5rem 0;
}
</style>
