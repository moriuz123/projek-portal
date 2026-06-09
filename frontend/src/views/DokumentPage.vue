<!-- frontend/src/pages/DokumentPage.vue -->
<template>
  <div>
    <!-- Page Header -->
    <PageHeader title="Daftar Dokumen" subtitle="Kumpulan dokumen resmi" />

    <section class="max-w-7xl mx-auto px-4 py-10">
      <!-- Filter & Search -->
      <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <!-- Filter Kategori -->
        <select v-model="selectedCategory" class="border rounded-lg px-4 py-2 w-full md:w-1/3">
          <option value="">Semua Kategori</option>
          <option v-for="(kategori, index) in kategoriList" :key="index" :value="kategori">
            {{ kategori }}
          </option>
        </select>

        <!-- Search -->
        <input
          v-model="searchQuery"
          type="text"
          placeholder="Cari dokumen..."
          class="border rounded-lg px-4 py-2 w-full md:w-1/3"
        />
      </div>

      <!-- Tabel Dokumen -->
      <div class="overflow-x-auto bg-white shadow-md rounded-lg">
        <table class="min-w-full border-collapse">
          <thead>
            <tr class="bg-gray-100 text-left">
              <th class="px-4 py-2 border">Judul</th>
              <th class="px-4 py-2 border">Kategori</th>
              <th class="px-4 py-2 border">Tanggal</th>
              <th class="px-4 py-2 border">Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="dokument in filteredDokument" :key="dokument.id" class="hover:bg-gray-50">
              <td class="px-4 py-2 border">{{ dokument.judul }}</td>
              <td class="px-4 py-2 border">{{ dokument.kategori.nama }}</td>
              <td class="px-4 py-2 border">
                {{ new Date(dokument.created_at).toLocaleDateString() }}
              </td>
              <td class="px-4 py-2 border flex gap-2">
                <!-- Lihat PDF di tab baru -->
                <a
                  :href="getFileUrl(dokument.file_path)"
                  target="_blank"
                  class="text-white bg-blue-600 hover:bg-blue-700 px-3 py-1 rounded cursor-pointer"
                >
                  Lihat
                </a>

                <!-- Download PDF -->
                <a
                  :href="getFileUrl(dokument.file_path)"
                  :download="dokument.judul + '.pdf'"
                  class="text-white bg-green-600 hover:bg-green-700 px-3 py-1 rounded cursor-pointer"
                >
                  Download
                </a>
              </td>
            </tr>
            <tr v-if="filteredDokument.length === 0">
              <td colspan="4" class="text-center py-4 text-gray-500">
                Tidak ada dokumen ditemukan.
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import PageHeader from '@/components/PageHeader.vue'
import { useDokumentStore } from '@/stores/dokument'

const dokumentStore = useDokumentStore()
const searchQuery = ref('')
const selectedCategory = ref('')

// Ambil data dokumen saat mounted
onMounted(() => {
  dokumentStore.fetchDokuments()
})

// Filter dokumen berdasarkan kategori & search
const filteredDokument = computed(() => {
  return dokumentStore.dokuments.filter((item) => {
    const matchCategory = selectedCategory.value
      ? item.kategori.nama === selectedCategory.value
      : true
    const matchSearch = item.judul.toLowerCase().includes(searchQuery.value.toLowerCase())
    return matchCategory && matchSearch
  })
})

// Daftar kategori unik untuk select
const kategoriList = computed(() => {
  return [...new Set(dokumentStore.dokuments.map((item) => item.kategori.nama))]
})

// Generate URL publik agar browser bisa akses PDF
function getFileUrl(filePath) {
  return `/storage/${filePath}`
}
</script>

<style scoped>
/* Styling opsional, tombol sudah ada hover effect */
</style>
