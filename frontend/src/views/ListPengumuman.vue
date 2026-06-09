<template>
  <div>
    <PageHeader title="Daftar Pengumuman" subtitle="Informasi terbaru untuk masyarakat" />

    <div class="max-w-7xl mx-auto px-4 py-6">
      <!-- 🔍 Form Pencarian -->
      <div v-if="!store.loading && !store.error" class="mb-8 flex flex-col items-center">
        <label class="text-gray-700 font-medium mb-2 text-center"> Cari Pengumuman </label>

        <input
          v-model="store.searchQuery"
          @input="store.currentPage = 1"
          type="text"
          placeholder="Masukkan kata kunci..."
          class="w-full sm:w-1/2 border border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-green-500"
        />
      </div>

      <!-- Loading -->
      <div v-if="store.loading" class="text-center py-10 text-gray-600">
        Memuat data pengumuman...
      </div>

      <!-- Error -->
      <div v-else-if="store.error" class="text-center py-10 text-red-600">
        {{ store.error }}
      </div>

      <!-- Tidak ada hasil -->
      <div
        v-else-if="store.filteredPengumuman.length === 0"
        class="text-center py-10 text-gray-500 italic"
      >
        Tidak ada pengumuman ditemukan.
      </div>

      <!-- GRID CARD -->
      <div v-else class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
        <div
          v-for="item in store.paginatedPengumuman"
          :key="item.id"
          class="bg-white rounded-xl shadow-lg hover:shadow-2xl transition-all duration-300 overflow-hidden group"
        >
          <!-- GAMBAR + ICON ZOOM -->
          <div
            class="relative h-40 w-full overflow-hidden cursor-pointer"
            @click="openImage(`/storage/${item.gambar}`)"
          >
            <img
              v-if="item.gambar"
              :src="`/storage/${item.gambar}`"
              alt="Gambar Pengumuman"
              class="h-full w-full object-cover group-hover:scale-105 transition duration-500"
            />

            <!-- Gradiasi overlay -->
            <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>

            <!-- ICON KACA PEMBESAR -->
            <div
              class="absolute inset-0 flex items-center justify-center opacity-70 group-hover:opacity-100 transition"
            >
              <div class="bg-white/80 p-3 rounded-full shadow-md">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-6 w-6 text-gray-700"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M21 21l-4.35-4.35m0 0A7.5 7.5 0 1110.5 3a7.5 7.5 0 016.15 13.65z"
                  />
                </svg>
              </div>
            </div>
          </div>

          <!-- KONTEN CARD -->
          <div class="p-4 flex flex-col text-center">
            <!-- Judul -->
            <h2 class="text-gray-800 font-semibold text-sm mb-4 leading-tight">
              {{ item.judul }}
            </h2>

            <router-link
              :to="`/pengumuman/${item.slug}`"
              class="mt-auto inline-block bg-green-600 text-white text-xs py-2 px-4 rounded-full shadow-sm hover:bg-green-700 transition"
            >
              Selengkapnya
            </router-link>
          </div>
        </div>
      </div>

      <!-- Pagination -->
      <div class="flex justify-center mt-8 space-x-2" v-if="store.totalPages > 1">
        <button
          @click="store.prevPage"
          :disabled="store.currentPage === 1"
          class="px-3 py-1 rounded-lg bg-gray-200 hover:bg-gray-300 disabled:opacity-50"
        >
          Prev
        </button>

        <button
          v-for="page in store.totalPages"
          :key="page"
          @click="store.goToPage(page)"
          :class="[
            'px-3 py-1 rounded-lg',
            store.currentPage === page
              ? 'bg-green-500 text-white'
              : 'bg-gray-200 hover:bg-gray-300',
          ]"
        >
          {{ page }}
        </button>

        <button
          @click="store.nextPage"
          :disabled="store.currentPage === store.totalPages"
          class="px-3 py-1 rounded-lg bg-gray-200 hover:bg-gray-300 disabled:opacity-50"
        >
          Next
        </button>
      </div>
    </div>

    <!-- 🔍 FULLSCREEN IMAGE MODAL -->
    <div
      v-if="selectedImage"
      class="fixed inset-0 bg-black/80 flex items-center justify-center z-50 p-4"
      @click="closeImage"
    >
      <img :src="selectedImage" class="max-w-full max-h-full rounded-lg shadow-xl" />
    </div>
  </div>
</template>

<script>
import PageHeader from '@/components/PageHeader.vue'
import { ref } from 'vue'
import { usePengumumanStore } from '@/stores/pengumuman'

export default {
  name: 'ListPengumuman',
  components: { PageHeader },

  setup() {
    const store = usePengumumanStore()
    store.fetchPengumuman()

    const selectedImage = ref(null)

    const openImage = (url) => {
      selectedImage.value = url
    }

    const closeImage = () => {
      selectedImage.value = null
    }

    return { store, selectedImage, openImage, closeImage }
  },
}
</script>
