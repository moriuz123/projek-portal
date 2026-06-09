<template>
  <div v-if="banners.length" class="relative bg-white shadow-md rounded-lg overflow-hidden">
    <!-- Gambar Banner -->
    <div class="w-full aspect-square">
      <img
        :src="`/storage/${banners[current].gambar}`"
        :alt="banners[current].title"
        class="w-full h-full object-cover transition-all duration-700 ease-in-out"
      />
    </div>

    <!-- Tombol Navigasi -->
    <button
      class="absolute left-2 top-1/2 transform -translate-y-1/2 bg-black/50 text-white px-2 py-1 rounded"
      @click="prevSlide"
    >
      Prev
    </button>
    <button
      class="absolute right-2 top-1/2 transform -translate-y-1/2 bg-black/50 text-white px-2 py-1 rounded"
      @click="nextSlide"
    >
      Next
    </button>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import axios from 'axios'

const banners = ref([])
const current = ref(0)
let intervalId = null

onMounted(async () => {
  try {
    const res = await axios.get('/api/banner?kategori=ucapan&limit=5')
    banners.value = res.data || []
    startSlideshow()
  } catch (err) {
    console.error('Gagal ambil banner:', err)
  }
})

onUnmounted(() => {
  if (intervalId) clearInterval(intervalId)
})

const nextSlide = () => {
  current.value = (current.value + 1) % banners.value.length
}

const prevSlide = () => {
  current.value = (current.value - 1 + banners.value.length) % banners.value.length
}

const startSlideshow = () => {
  if (intervalId) clearInterval(intervalId)
  intervalId = setInterval(() => {
    nextSlide()
  }, 6000) // 6 detik biar lebih smooth
}
</script>
