<template>
  <aside class="hidden lg:block lg:sticky lg:top-24">
    <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 space-y-4">
      <h2 class="font-semibold text-gray-800 text-lg border-b pb-2 mb-2">Halaman Terkait</h2>

      <ul class="space-y-2">
        <li
          v-for="item in links"
          :key="item.slug"
          class="transition-all duration-200 hover:translate-x-1"
        >
          <router-link
            :to="`/page/${item.slug}`"
            class="flex items-center text-gray-700 hover:text-green-600 font-medium text-sm"
          >
            <span class="w-2 h-2 bg-green-500 rounded-full mr-2"></span>
            {{ item.judul }}
          </router-link>
        </li>
      </ul>
    </div>
  </aside>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const links = ref([])

const loadSidebarLinks = async () => {
  try {
    const res = await axios.get('/api/halaman-statis')
    if (res.data.status === 'success') {
      links.value = res.data.data
    }
  } catch (err) {
    console.error('Gagal memuat sidebar static:', err)
  }
}

onMounted(() => {
  loadSidebarLinks()
})
</script>

<style scoped>
aside a.router-link-active {
  color: #16a34a; /* hijau utama */
  font-weight: 600;
}
</style>
