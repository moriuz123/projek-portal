<template>
  <section class="bg-gray-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Header (sama dengan DokumenSection) -->
      <div class="flex justify-between items-center mb-6">
        <div>
          <h2 class="text-2xl font-bold text-gray-800">Infografis</h2>
          <p class="text-gray-500 text-sm mt-1">Kumpulan data & informasi dalam bentuk visual</p>
        </div>

        <!-- CTA: sama style seperti DokumenSection, menuju halaman /banner/infografis -->
        <router-link
          to="/banner/infografis"
          class="border border-green-600 text-green-600 px-4 py-2 rounded-lg hover:bg-green-50 transition"
        >
          Lihat Semua Infografis
        </router-link>
      </div>

      <!-- Content carousel -->
      <div v-if="loading" class="text-center text-gray-500">Loading...</div>
      <div v-else-if="error" class="text-center text-red-500">{{ error?.message ?? error }}</div>

      <div v-else class="relative">
        <!-- tombol navigasi -->
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

        <!-- carousel scrollable -->
        <div
          ref="carouselRef"
          @scroll="updateActiveDot"
          class="flex space-x-4 overflow-x-auto scrollbar-hide scroll-smooth py-4"
        >
          <div
            v-for="item in banners"
            :key="item.id"
            class="w-[250px] sm:w-[280px] md:w-[300px] bg-white border rounded-lg shadow-sm flex-shrink-0 hover:shadow-lg transition overflow-hidden relative group"
          >
            <!-- Thumbnail -->
            <img
              :src="item.gambar_url"
              :alt="item.judul"
              class="w-full h-48 object-cover transform group-hover:scale-105 transition duration-500"
              @click="openPreview(item.gambar_url)"
            />

            <!-- Overlay zoom (muncul saat hover) -->
            <div
              class="absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition bg-black/30"
            >
              <button
                @click.stop="openPreview(item.gambar_url)"
                class="bg-white text-gray-700 rounded-full p-3 shadow-lg hover:bg-gray-200 transition"
              >
                🔍
              </button>
            </div>

            <!-- Info -->
            <div class="px-4 pb-4 pt-2">
              <p class="text-xs text-gray-500 uppercase">{{ item.kategori }}</p>
              <h3 class="font-semibold text-gray-800 truncate mt-1" :title="item.judul">
                {{ item.judul }}
              </h3>
            </div>
          </div>
        </div>

        <!-- Dot indicators -->
        <div class="flex justify-center mt-4 space-x-2">
          <span
            v-for="(b, index) in banners"
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

    <!-- Modal Preview -->
    <div
      v-if="previewImage"
      class="fixed inset-0 bg-black/80 flex items-center justify-center z-50 p-4"
      @click.self="closePreview"
    >
      <div class="relative max-w-4xl w-full px-4">
        <button
          @click="closePreview"
          class="absolute -top-10 right-0 text-white text-3xl hover:text-gray-300"
        >
          ✖
        </button>
        <img
          :src="previewImage"
          alt="Preview"
          class="w-full max-h-[80vh] object-contain rounded-lg shadow-lg"
        />
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { useBannerStore } from '@/stores/bannerStore'

const bannerStore = useBannerStore()
const { banners, loading, error } = storeToRefs(bannerStore)

const carouselRef = ref(null)
const activeIndex = ref(0)
const previewImage = ref(null)

// ambil data
onMounted(() => {
  bannerStore.fetchByKategori('infografis')
})

// navigasi scroll
const scrollLeft = () => {
  if (!carouselRef.value) return
  carouselRef.value.scrollBy({ left: -300, behavior: 'smooth' })
  // setTimeout sedikit untuk memberi waktu scroll lalu update dot
  setTimeout(updateActiveDot, 200)
}
const scrollRight = () => {
  if (!carouselRef.value) return
  carouselRef.value.scrollBy({ left: 300, behavior: 'smooth' })
  setTimeout(updateActiveDot, 200)
}

// update dot aktif berdasarkan posisi scroll
function updateActiveDot() {
  if (!carouselRef.value) return
  const scrollLeftVal = carouselRef.value.scrollLeft
  const maxScroll = carouselRef.value.scrollWidth - carouselRef.value.clientWidth
  const totalDots = Math.max(1, banners.value.length)
  if (maxScroll <= 0) {
    activeIndex.value = 0
    return
  }
  activeIndex.value = Math.round((scrollLeftVal / maxScroll) * (totalDots - 1))
}

// klik dot untuk scroll ke posisi
function goToDot(index) {
  if (!carouselRef.value) return
  const maxScroll = carouselRef.value.scrollWidth - carouselRef.value.clientWidth
  const denom = Math.max(1, banners.value.length - 1)
  const scrollPos = (maxScroll / denom) * index
  carouselRef.value.scrollTo({ left: scrollPos, behavior: 'smooth' })
  activeIndex.value = index
}

// preview image
function openPreview(img) {
  previewImage.value = img
}
function closePreview() {
  previewImage.value = null
}
</script>

