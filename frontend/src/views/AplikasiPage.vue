<template>
  <div>
    <!-- Header -->
    <PageHeader title="Daftar Aplikasi" />

    <div class="max-w-6xl mx-auto px-4 py-10">
      <!-- Filter -->
      <div class="flex flex-col md:flex-row gap-4 mb-6">
        <select v-model="selectedKategori" class="border p-2 rounded w-full md:w-1/4">
          <option value="">Semua Kategori</option>
          <option value="Aplikasi Layanan Publik">Aplikasi Layanan Publik</option>
          <option value="Internal Pemerintah">Internal Pemerintah</option>
        </select>

        <select v-model="selectedJenis" class="border p-2 rounded w-full md:w-1/4">
          <option value="">Semua Jenis</option>
          <option value="Website">Website</option>
          <option value="Mobile">Mobile</option>
        </select>

        <input
          v-model="searchQuery"
          type="text"
          placeholder="Cari aplikasi..."
          class="border p-2 rounded w-full md:w-1/3"
        />

        <button
          @click="loadData"
          class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-800"
        >
          Terapkan
        </button>
      </div>

      <!-- Loading -->
      <div v-if="aplikasiStore.loading" class="text-center text-gray-500 py-4">Memuat data...</div>

      <!-- Error -->
      <div v-if="aplikasiStore.error" class="text-center text-green-500 py-4">
        {{ aplikasiStore.error }}
      </div>

      <!-- Table -->
      <div v-if="!aplikasiStore.loading && aplikasiStore.aplikasis.length > 0">
        <table class="w-full border border-gray-200">
          <thead>
            <tr class="bg-green-300">
              <th class="p-2 border">#</th>
              <th class="p-2 border">Icon</th>
              <th class="p-2 border">Nama</th>
              <th class="p-2 border">Jenis</th>
              <th class="p-2 border">Kategori</th>
              <th class="p-2 border">Deskripsi</th>
              <th class="p-2 border">Link</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(app, index) in aplikasiStore.aplikasis"
              :key="app.id"
              class="hover:bg-gray-200"
            >
              <td class="p-2 border text-center">{{ index + 1 }}</td>
              <td class="p-2 border text-center">
                <img
                  :src="`/storage/${app.icon}`"
                  alt="icon"
                  class="w-10 h-10 object-contain mx-auto"
                />
              </td>
              <td class="p-2 border font-semibold">{{ app.nama }}</td>
              <td class="p-2 border">{{ app.jenis }}</td>
              <td class="p-2 border">{{ app.kategori }}</td>
              <td class="p-2 border text-sm">{{ app.deskripsi }}</td>
              <td class="p-2 border text-green-600 underline">
                <a :href="app.link" target="_blank">Buka</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Empty state -->
      <div v-else-if="!aplikasiStore.loading" class="text-center text-gray-500 py-6">
        Tidak ada data aplikasi ditemukan.
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useAplikasiStore } from '../stores/aplikasi'
import PageHeader from '../components/PageHeader.vue'

const aplikasiStore = useAplikasiStore()

const selectedKategori = ref('')
const selectedJenis = ref('')
const searchQuery = ref('')

const loadData = () => {
  const params = {}
  if (selectedKategori.value) params.kategori = selectedKategori.value
  if (selectedJenis.value) params.jenis = selectedJenis.value
  if (searchQuery.value) params.search = searchQuery.value
  aplikasiStore.fetchAplikasis(params)
}

onMounted(() => {
  loadData()
})
</script>
