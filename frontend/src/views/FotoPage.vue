<template>
  <div>
    <!-- Page Header -->
    <PageHeader title="Galeri Foto" />

    <div class="max-w-6xl mx-auto px-4 py-10">
      <!-- Filter Kategori -->
      <div class="mb-6 flex items-center gap-4">
        <label for="kategori" class="font-medium text-gray-700">Filter Kategori:</label>
        <select
          id="kategori"
          v-model="selectedKategori"
          class="border rounded-lg px-3 py-2 focus:outline-none focus:ring focus:ring-blue-200"
        >
          <option value="">Semua</option>
          <option v-for="kat in kategoriUnik" :key="kat" :value="kat">
            {{ kat }}
          </option>
        </select>
      </div>

      <!-- Loading -->
      <div v-if="loading" class="text-center text-gray-500">Memuat data...</div>

      <!-- Error -->
      <div v-else-if="error" class="text-center text-red-500">{{ error }}</div>

      <!-- List Foto -->
      <div v-else class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
        <div
          v-for="foto in filteredFotos"
          :key="foto.id"
          class="bg-white rounded-xl shadow hover:shadow-lg overflow-hidden"
        >
          <!-- Foto dengan overlay icon -->
          <div class="relative group cursor-pointer" @click="openPreview(foto)">
            <img
              :src="`/storage/${foto.gambar}`"
              :alt="foto.judul"
              class="w-full h-56 object-cover"
            />
            <!-- Overlay icon -->
            <div
              class="absolute inset-0 flex items-center justify-center bg-black bg-opacity-40 opacity-0 group-hover:opacity-100 transition"
            >
              <ZoomIn class="w-10 h-10 text-white" />
            </div>
          </div>

          <!-- Info Foto -->
          <div class="p-4">
            <h3 class="text-lg font-semibold text-gray-800 mb-2">{{ foto.judul }}</h3>
            <p class="text-gray-600 text-sm">{{ foto.deskripsi }}</p>
            <p class="mt-2 text-xs text-gray-500 italic">
              Kategori: {{ foto.kategori?.nama || '-' }}
            </p>
          </div>
        </div>
      </div>

      <!-- Kosong -->
      <div v-if="!loading && filteredFotos.length === 0" class="text-center text-gray-500 mt-6">
        Tidak ada foto tersedia.
      </div>
    </div>

    <!-- Modal Preview -->
    <div
      v-if="previewFoto"
      class="fixed inset-0 bg-black bg-opacity-70 flex items-center justify-center z-50"
      @click.self="closePreview"
    >
      <div class="relative bg-white rounded-lg max-w-3xl w-full overflow-hidden">
        <!-- Tombol Close -->
        <button
          class="absolute top-3 right-3 bg-gray-800 text-white p-2 rounded-full hover:bg-gray-700 focus:outline-none"
          @click="closePreview"
        >
          <X class="w-5 h-5" />
        </button>

        <img
          :src="`/storage/${previewFoto.gambar}`"
          :alt="previewFoto.judul"
          class="w-full max-h-[80vh] object-contain"
        />
        <div class="p-4">
          <h3 class="text-lg font-semibold">{{ previewFoto.judul }}</h3>
          <p class="text-gray-600 text-sm">{{ previewFoto.deskripsi }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, computed } from 'vue'
import { storeToRefs } from 'pinia'
import { useFotoStore } from '@/stores/foto'
import PageHeader from '@/components/PageHeader.vue'

import { ZoomIn, X } from 'lucide-vue-next'

const fotoStore = useFotoStore()
const { fotos, loading, error } = storeToRefs(fotoStore)

const selectedKategori = ref('')
const previewFoto = ref(null)

onMounted(() => {
  fotoStore.fetchFotos()
})

// Ambil kategori unik
const kategoriUnik = computed(() => {
  const set = new Set()
  fotos.value.forEach((f) => {
    if (f.kategori?.nama) set.add(f.kategori.nama)
  })
  return Array.from(set)
})

// Filter berdasarkan kategori
const filteredFotos = computed(() => {
  if (!selectedKategori.value) return fotos.value
  return fotos.value.filter((f) => f.kategori?.nama === selectedKategori.value)
})

// Modal preview
const openPreview = (foto) => {
  previewFoto.value = foto
}
const closePreview = () => {
  previewFoto.value = null
}
</script>
