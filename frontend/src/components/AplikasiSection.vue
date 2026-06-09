<template>
  <section class="bg-gray-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Header (sama dengan DokumenSection) -->
      <div class="flex justify-between items-center mb-6">
        <div>
          <h2 class="text-2xl font-bold text-gray-800">Aplikasi</h2>
          <p class="text-gray-500 text-sm mt-1">Jumlah aplikasi: {{ aplikasiItems.length }}</p>
        </div>

        <!-- CTA: style sama seperti DokumenSection -->
        <router-link
          to="/aplikasi"
          class="border border-green-600 text-green-600 px-4 py-2 rounded-lg hover:bg-green-50 transition"
        >
          Lihat Semua Aplikasi
        </router-link>
      </div>

      <!-- Grid Aplikasi (tidak diubah, sesuai permintaan) -->
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
        <div
          v-for="item in aplikasiItems"
          :key="item.id"
          class="flex items-center bg-white rounded-lg shadow-md p-5 space-x-5 hover:shadow-xl transition-shadow duration-300 cursor-pointer"
          @click="goToLink(item.link)"
          role="link"
          tabindex="0"
          @keyup.enter="goToLink(item.link)"
        >
          <img :src="getIconUrl(item.icon)" alt="icon" class="w-12 h-12 object-contain" />
          <span class="text-gray-800 font-semibold text-base">
            {{ item.nama }}
          </span>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

export default {
  name: 'DataAplikasiCards',
  data() {
    return {
      aplikasiItems: [],
      kategori: 'Aplikasi Layanan Publik', // ganti sesuai kebutuhan atau jadikan props
    }
  },
  mounted() {
    this.fetchDataAplikasi()
  },
  methods: {
    /**
     * Fetch data aplikasi dari backend API menggunakan Axios.
     * Endpoint sudah memakai proxy di vue.config.js untuk menghindari masalah CORS.
     */
    async fetchDataAplikasi() {
      try {
        const response = await axios.get('/api/data-aplikasi', {
          params: { kategori: this.kategori },
        })
        // sesuaikan akses response sesuai struktur API Anda
        if (response.data?.status === 'success' && Array.isArray(response.data.data)) {
          this.aplikasiItems = response.data.data
        } else if (Array.isArray(response.data)) {
          // fallback: API langsung mengembalikan array
          this.aplikasiItems = response.data
        } else {
          console.warn('API returned unexpected format:', response.data)
        }
      } catch (error) {
        console.error('Gagal fetch data aplikasi:', error)
      }
    },

    /**
     * Membentuk URL lengkap untuk icon aplikasi.
     * Asumsi file icon ada di `storage/app/public/` dan sudah di-link ke `public/storage`.
     */
    getIconUrl(iconPath) {
      if (!iconPath) {
        return '/images/icons/default-app-icon.webp'
      }
      const cleanPath = iconPath.startsWith('/') ? iconPath.substring(1) : iconPath
      return `/storage/${cleanPath}`
    },

    /**
     * Buka link aplikasi di tab baru ketika card diklik.
     */
    goToLink(link) {
      if (link) {
        window.open(link, '_blank')
      }
    },

    /**
     * Fungsi placeholder (tetap ada jika perlu dipakai).
     */
    handleMore() {
      // tidak digunakan karena CTA sekarang mengarah ke /aplikasi
      // tetap disediakan jika ingin reuse
      this.$router.push('/aplikasi')
    },
  },
}
</script>

<style scoped>
/* tidak mengubah style card, hanya menyertakan scoped jika Anda mau menambah style */
</style>
