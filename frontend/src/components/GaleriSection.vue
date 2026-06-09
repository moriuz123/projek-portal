<template>
  <section class="py-10 bg-white">
    <div class="container mx-auto px-4">
      <h2 class="text-2xl font-bold mb-6">Galeri Kegiatan</h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
        <div v-for="item in galeri" :key="item.id" class="bg-white shadow rounded overflow-hidden">
          <img :src="item.gambar" :alt="item.judul" class="w-full h-48 object-cover" />
          <div class="p-4">
            <h3 class="text-lg font-semibold">{{ item.judul }}</h3>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const galeri = ref([])

onMounted(async () => {
  try {
    const res = await axios.get('/api/galeri')
    galeri.value = res.data.data
  } catch (error) {
    console.error('Gagal memuat data galeri:', error)
  }
})
</script>
