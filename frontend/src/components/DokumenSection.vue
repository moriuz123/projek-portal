<!-- frontend/src/components/DokumenSection.vue -->
<script setup>
import { onMounted, ref, computed } from 'vue'
import { useDokumentStore } from '@/stores/dokument'
import { storeToRefs } from 'pinia'
import VuePdfApp from 'vue3-pdf-app'
import 'vue3-pdf-app/dist/icons/main.css'

const dokumentStore = useDokumentStore()
const { dokuments, loading, error } = storeToRefs(dokumentStore)

const carouselRef = ref(null)
const activeIndex = ref(0) // dot aktif

// Modal flipbook
const showFlipbook = ref(false)
const selectedFileUrl = ref(null)

onMounted(() => {
  dokumentStore.fetchDokuments()
})

// Tombol scroll
const scrollLeft = () => {
  carouselRef.value.scrollBy({ left: -300, behavior: 'smooth' })
  updateActiveDot()
}
const scrollRight = () => {
  carouselRef.value.scrollBy({ left: 300, behavior: 'smooth' })
  updateActiveDot()
}

// ✅ Tombol Lihat (flipbook modal)
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

// ✅ Tombol Unduh (langsung download)
function unduh(doc) {
  const link = document.createElement('a')
  link.href = getFileUrl(doc.file_path)
  link.download = `${doc.judul}.pdf`
  link.click()
}

// FIXED DOTS (misal 5 titik)
const DOT_COUNT = 5

const visibleDots = computed(() => {
  return Array.from({ length: DOT_COUNT })
})

// Hitung dot aktif berdasarkan posisi scroll
const updateActiveDot = () => {
  const maxScroll = carouselRef.value.scrollWidth - carouselRef.value.clientWidth
  const ratio = carouselRef.value.scrollLeft / maxScroll
  activeIndex.value = Math.round(ratio * (DOT_COUNT - 1))
}

// Klik dot → scroll ke posisi tertentu
const goToDot = (index) => {
  const maxScroll = carouselRef.value.scrollWidth - carouselRef.value.clientWidth
  const scrollPos = (maxScroll / (DOT_COUNT - 1)) * index
  carouselRef.value.scrollTo({ left: scrollPos, behavior: 'smooth' })
  activeIndex.value = index
}
</script>

<template>
  <section class="bg-gray-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Header -->
      <div class="flex justify-between items-center mb-6">
        <div>
          <h2 class="text-2xl font-bold text-gray-800">Transparansi Anggaran</h2>
        </div>
        <a
          href="/dokumen"
          class="border border-green-600 text-green-600 px-4 py-2 rounded-lg hover:bg-green-50 transition"
        >
          Lihat Semua Laporan
        </a>
      </div>

      <!-- Content Carousel -->
      <div v-if="loading" class="text-center text-gray-500">Loading...</div>
      <div v-else-if="error" class="text-center text-red-500">{{ error }}</div>

      <div v-else class="relative">
        <!-- Tombol navigasi -->
        <button
          @click="scrollLeft"
          class="absolute left-0 top-1/2 -translate-y-1/2 z-10 bg-white p-2 rounded-full shadow hover:bg-gray-100"
        >
          ◀
        </button>
        <button
          @click="scrollRight"
          class="absolute right-0 top-1/2 -translate-y-1/2 z-10 bg-white p-2 rounded-full shadow hover:bg-gray-100"
        >
          ▶
        </button>

        <!-- Carousel -->
        <div
          ref="carouselRef"
          @scroll="updateActiveDot"
          class="flex space-x-4 overflow-x-auto scrollbar-hide scroll-smooth py-4"
        >
          <div
            v-for="doc in dokuments"
            :key="doc.id"
            class="w-[250px] sm:w-[280px] md:w-[300px] bg-white border rounded-lg shadow-sm flex-shrink-0 hover:shadow-lg transition overflow-hidden"
          >
            <!-- Ikon PDF -->
            <div class="p-4 flex justify-center bg-gray-100">
              <img src="/images/pdf-icon.png" alt="PDF" class="h-16 w-auto" />
            </div>

            <!-- Info dokumen -->
            <div class="px-4 pb-4">
              <p class="text-xs text-gray-500 uppercase">{{ doc.kategori?.nama }}</p>
              <h3 class="font-semibold text-gray-800 truncate mt-1" :title="doc.judul">
                {{ doc.judul }}
              </h3>
              <p class="text-sm text-gray-600 mt-1 line-clamp-2">{{ doc.deskripsi }}</p>
              <div class="flex justify-between items-center mt-4">
                <button
                  @click="openFlipbook(doc)"
                  class="flex items-center text-blue-600 border border-blue-600 px-3 py-1 rounded hover:bg-blue-50 transition"
                >
                  👁 Lihat
                </button>
                <button
                  @click="unduh(doc)"
                  class="flex items-center bg-green-600 text-white px-3 py-1 rounded hover:bg-green-700 transition"
                >
                  ⬇ Unduh
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Dot indicators -->
        <div class="flex justify-center mt-4 space-x-2">
          <span
            v-for="(dot, index) in visibleDots"
            :key="index"
            @click="goToDot(index)"
            :class="[
              'dot-small rounded-full cursor-pointer transition',
              activeIndex === index ? 'bg-green-600' : 'bg-gray-300',
            ]"
          ></span>
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
  </section>
</template>

<style>
.scrollbar-hide::-webkit-scrollbar {
  display: none;
}
.scrollbar-hide {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
</style>
