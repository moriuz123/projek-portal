<template>
  <PageHeader title="Halaman Tidak ada" />
  <div class="flex flex-col items-center justify-center h-screen bg-gray-100 text-center">
    <h1 class="text-9xl font-bold text-gray-800">404</h1>
    <p class="mt-4 text-2xl font-semibold text-gray-600">Halaman Tidak Ditemukan</p>
    <p class="mt-2 text-gray-500">
      Maaf, halaman yang Anda cari tidak tersedia atau telah dipindahkan.
    </p>

    <router-link
      to="/"
      class="mt-6 px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-lg shadow transition"
    >
      Kembali ke Beranda
    </router-link>
  </div>
</template>

<script setup>
import PageHeader from '@/components/PageHeader.vue'

// Tidak perlu script khusus, cukup router-link untuk navigasi
</script>
