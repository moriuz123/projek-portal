<!-- frontend/src/pages/DokumenKategoriPage.vue -->
<template>
  <div>
    <!-- ✅ Page Header -->
    <PageHeader :title="`Dokumen - ${dokumentStore.kategori?.nama || ''}`" />

    <div class="container mx-auto p-6">
      <div v-if="dokumentStore.loading">Memuat...</div>
      <div v-else-if="dokumentStore.error" class="text-red-500">
        {{ dokumentStore.error }}
      </div>
      <div v-else>
        <div v-if="dokumentStore.dokuments.length === 0">
          <p>Tidak ada dokumen dalam kategori ini.</p>
        </div>
        <div v-else class="overflow-x-auto bg-white shadow-md rounded-lg">
          <table class="min-w-full border-collapse">
            <thead>
              <tr class="bg-gray-100 text-left">
                <th class="px-4 py-2 border">Judul</th>
                <th class="px-4 py-2 border">Sumber</th>
                <th class="px-4 py-2 border">Tanggal</th>
                <th class="px-4 py-2 border">Aksi</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="doc in dokumentStore.dokuments" :key="doc.id" class="hover:bg-gray-50">
                <td class="px-4 py-2 border">{{ doc.judul }}</td>
                <td class="px-4 py-2 border">{{ doc.sumber || '-' }}</td>
                <td class="px-4 py-2 border">
                  {{ new Date(doc.created_at).toLocaleDateString('id-ID') }}
                </td>
                <td class="px-4 py-2 border flex gap-2">
                  <!-- Tombol Lihat -->
                  <button
                    @click="openFlipbook(doc)"
                    class="text-white bg-blue-600 hover:bg-blue-700 px-3 py-1 rounded cursor-pointer"
                  >
                    Lihat
                  </button>

                  <!-- Tombol Download -->
                  <a
                    v-if="doc.file_path"
                    :href="getFileUrl(doc.file_path)"
                    :download="doc.judul + '.pdf'"
                    class="text-white bg-green-600 hover:bg-green-700 px-3 py-1 rounded cursor-pointer"
                  >
                    Download
                  </a>
                </td>
              </tr>
              <tr v-if="dokumentStore.dokuments.length === 0">
                <td colspan="4" class="text-center py-4 text-gray-500">
                  Tidak ada dokumen ditemukan.
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- ✅ Modal Flipbook -->
    <div
      v-if="showFlipbook"
      class="fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center z-50"
    >
      <div class="bg-white w-11/12 h-5/6 rounded shadow-lg relative">
        <button
          @click="closeFlipbook"
          class="absolute top-2 right-2 bg-red-500 text-white px-3 py-1 rounded"
        >
          ✕
        </button>
        <VuePdfApp :pdf="selectedFileUrl" class="w-full h-full" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRoute } from 'vue-router'
import { useDokumentStore } from '@/stores/dokument'
import { onMounted, ref } from 'vue'
import PageHeader from '@/components/PageHeader.vue'
import VuePdfApp from 'vue3-pdf-app'
import 'vue3-pdf-app/dist/icons/main.css'

const route = useRoute()
const dokumentStore = useDokumentStore()

const showFlipbook = ref(false)
const selectedFileUrl = ref(null)

// Ambil dokumen per kategori
onMounted(() => {
  dokumentStore.fetchDokumentsByKategori(route.params.slug)
})

function getFileUrl(filePath) {
  return `/storage/${filePath}`
}

function openFlipbook(doc) {
  selectedFileUrl.value = getFileUrl(doc.file_path)
  showFlipbook.value = true
}

function closeFlipbook() {
  showFlipbook.value = false
  selectedFileUrl.value = null
}
</script>

<style scoped>
/* Bisa tambahkan styling modal kalau mau */
</style>
