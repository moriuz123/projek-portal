<script setup>
import { onMounted, ref, watch } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'
import SidebarStatic from '../components/SidebarStatic.vue'
import PageHeader from '../components/PageHeader.vue'

const route = useRoute()
const page = ref(null)
const loading = ref(true)

const loadPage = async (slug) => {
  loading.value = true
  try {
    const { data } = await axios.get(`/api/halaman-statis/${slug}`)
    if (data.status === 'success') {
      page.value = data.data
    }
  } catch (err) {
    console.error('Gagal memuat halaman statis:', err)
  } finally {
    loading.value = false
  }
}

// 🔹 Saat pertama kali mount
onMounted(() => {
  loadPage(route.params.slug)
})

// 🔹 Watch perubahan slug agar isi halaman otomatis diperbarui
watch(
  () => route.params.slug,
  (newSlug) => {
    loadPage(newSlug)
  },
)
</script>

<template>
  <div>
    <!-- Loading State -->
    <div v-if="loading" class="text-center py-20 text-gray-500">Memuat konten...</div>

    <!-- Halaman Statis -->
    <div v-else-if="page">
      <!-- Header -->
      <PageHeader :title="page.judul" />

      <div class="max-w-screen-xl mx-auto px-4 lg:px-0 lg:flex lg:space-x-8 mt-8">
        <!-- Konten Utama -->
        <article
          class="lg:w-3/4 bg-white rounded-xl shadow-lg border border-gray-100 p-6 prose prose-green max-w-none"
        >
          <div v-html="page.isi" class="text-gray-800 leading-relaxed"></div>
        </article>

        <!-- Sidebar -->
        <aside class="hidden lg:block lg:w-1/4">
          <SidebarStatic />
        </aside>
      </div>
    </div>

    <!-- Jika Tidak Ada Konten -->
    <div v-else class="text-center py-20 text-gray-500">Halaman tidak ditemukan.</div>
  </div>
</template>

<style scoped>
.prose a {
  color: #16a34a;
  text-decoration: underline;
}
.prose a:hover {
  color: #15803d;
}
</style>
