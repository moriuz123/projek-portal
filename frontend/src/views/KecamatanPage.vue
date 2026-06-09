<template>
  <div>
    <!-- Header -->
    <PageHeader title="Data Kecamatan" />

    <!-- Konten Utama -->
    <div class="max-w-7xl mx-auto px-4 py-10">
      <!-- Loading -->
      <div v-if="loading" class="text-center py-10 text-gray-500">Memuat data kecamatan...</div>

      <!-- Error -->
      <div v-if="error" class="text-center py-10 text-red-500">{{ error }}</div>

      <!-- Pencarian -->
      <div v-if="!loading && !error" class="mb-8 flex flex-col items-center">
        <label class="text-gray-700 font-medium mb-2 text-center"> Cari Kecamatan </label>
        <input
          v-model="searchQuery"
          type="text"
          placeholder="Masukkan nama kecamatan..."
          class="w-full sm:w-1/2 border border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-green-500"
        />
      </div>

      <!-- Daftar Kecamatan -->
      <div v-if="!loading && !error">
        <div class="grid gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
          <div
            v-for="kecamatan in paginatedKecamatan"
            :key="kecamatan.slug"
            class="relative bg-white border border-gray-100 rounded-xl shadow-sm hover:shadow-lg hover:border-green-500 transition-all duration-300 p-4 flex flex-col"
          >
            <!-- Logo di kiri atas -->
            <div class="absolute -top-6 left-1/2 transform -translate-x-1/2">
              <img
                v-if="kecamatan.logo"
                :src="`/storage/${kecamatan.logo}`"
                alt="Logo Kecamatan"
                class="h-12 w-12 rounded-full object-cover ring-2 ring-green-500 shadow-sm bg-white"
              />
              <div
                v-else
                class="h-12 w-12 flex items-center justify-center bg-gray-100 text-gray-500 rounded-full ring-2 ring-green-400 text-[10px]"
              >
                No Logo
              </div>
            </div>

            <!-- Isi Card -->
            <div class="pt-10 text-left">
              <h3 class="text-sm font-semibold text-gray-800 mb-2 line-clamp-2">
                {{ kecamatan.nama }}
              </h3>

              <div class="text-xs text-gray-600 space-y-1">
                <p><strong>Telepon:</strong> {{ kecamatan.telepon || '-' }}</p>
                <p>
                  <strong>Website:</strong>
                  <a
                    v-if="kecamatan.website"
                    :href="kecamatan.website"
                    target="_blank"
                    class="text-green-700 hover:underline break-all"
                  >
                    {{ kecamatan.website }}
                  </a>
                  <span v-else>-</span>
                </p>
                <p class="line-clamp-3">
                  <strong>Alamat:</strong> {{ kecamatan.alamat_kantor || '-' }}
                </p>
              </div>
            </div>

            <!-- Tombol CTA -->
            <div class="mt-auto pt-4">
              <router-link
                :to="{ name: 'KecamatanDetail', params: { slug: kecamatan.slug } }"
                class="block text-center text-white bg-green-600 hover:bg-green-700 text-sm py-2 rounded-lg transition"
              >
                Lihat Detail
              </router-link>
            </div>
          </div>
        </div>

        <!-- Navigasi Halaman -->
        <div class="flex justify-center items-center mt-10 space-x-3">
          <button
            @click="prevPage"
            :disabled="currentPage === 1"
            class="px-3 py-1 border rounded disabled:opacity-50 hover:bg-gray-100 transition"
          >
            Prev
          </button>
          <span class="text-sm font-medium text-gray-700">
            Halaman {{ currentPage }} dari {{ totalPages }}
          </span>
          <button
            @click="nextPage"
            :disabled="currentPage === totalPages"
            class="px-3 py-1 border rounded disabled:opacity-50 hover:bg-gray-100 transition"
          >
            Next
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useKecamatanStore } from '@/stores/kecamatan'
import { onMounted, computed, ref, watch } from 'vue'
import PageHeader from '@/components/PageHeader.vue'

const kecamatanStore = useKecamatanStore()
const currentPage = ref(1)
const perPage = 8
const searchQuery = ref('')

// Fetch data kecamatan
onMounted(() => {
  kecamatanStore.fetchKecamatan()
})

const kecamatans = computed(() => kecamatanStore.kecamatans)
const loading = computed(() => kecamatanStore.loading)
const error = computed(() => kecamatanStore.error)

// Filter berdasarkan search
const filteredKecamatan = computed(() => {
  if (!searchQuery.value) return kecamatans.value
  return kecamatans.value.filter((k) =>
    k.nama.toLowerCase().includes(searchQuery.value.toLowerCase()),
  )
})

// Pagination
const totalPages = computed(() => Math.ceil(filteredKecamatan.value.length / perPage))
const paginatedKecamatan = computed(() => {
  const start = (currentPage.value - 1) * perPage
  return filteredKecamatan.value.slice(start, start + perPage)
})

// Reset halaman jika search berubah
watch(searchQuery, () => {
  currentPage.value = 1
})

function nextPage() {
  if (currentPage.value < totalPages.value) currentPage.value++
}
function prevPage() {
  if (currentPage.value > 1) currentPage.value--
}
</script>
