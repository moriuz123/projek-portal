<template>
  <footer class="footer text-white text-sm">
    <!-- Bagian Atas -->
    <div class="footer-top py-6">
      <div class="container mx-auto px-4 text-center">
        <!-- Logo -->
        <div v-if="footer.logo_url" class="mb-3">
          <img :src="footer.logo_url" alt="Logo" class="mx-auto h-14" />
        </div>

        <!-- Nama Website & Satuan Kerja -->
        <h2 class="text-2xl text-white font-bold mb-1 tracking-wide">{{ footer.site_name }}</h2>
        <p class="footer-satuan">{{ footer.satuan_kerja }}</p>

        <!-- Alamat & Kontak -->
        <div class="footer-info mb-6">
          <p>{{ footer.address }}</p>
          <p v-if="footer.phone">Telp: {{ footer.phone }}</p>
          <p v-if="footer.email">Email: {{ footer.email }}</p>
        </div>

        <!-- Media Sosial -->
        <div class="flex justify-center space-x-3 mb-5">
          <a
            v-if="footer.facebook"
            :href="footer.facebook"
            target="_blank"
            class="social-icon bg-blue-600 hover:bg-blue-700"
          >
            <Facebook class="w-4 h-4" />
          </a>
          <a
            v-if="footer.instagram"
            :href="footer.instagram"
            target="_blank"
            class="social-icon bg-gradient-to-tr from-yellow-400 via-pink-500 to-purple-600"
          >
            <Instagram class="w-4 h-4" />
          </a>
          <a
            v-if="footer.twitter"
            :href="footer.twitter"
            target="_blank"
            class="social-icon bg-sky-500 hover:bg-sky-600"
          >
            <Twitter class="w-4 h-4" />
          </a>
          <a
            v-if="footer.youtube"
            :href="footer.youtube"
            target="_blank"
            class="social-icon bg-red-600 hover:bg-red-700"
          >
            <Youtube class="w-4 h-4" />
          </a>
          <a
            v-if="footer.whatsapp"
            :href="`https://wa.me/${footer.whatsapp}`"
            target="_blank"
            class="social-icon bg-green-600 hover:bg-green-700"
          >
            <MessageCircle class="w-4 h-4" />
          </a>
        </div>
      </div>
    </div>

    <!-- Bagian Bawah -->
    <div class="footer-bottom">
      <p>© {{ new Date().getFullYear() }} - {{ footer.footer_text }}</p>
    </div>
  </footer>
</template>

<script>
import axios from 'axios'
import { Facebook, Instagram, Twitter, Youtube, MessageCircle } from 'lucide-vue-next'

export default {
  name: 'Footer',
  components: { Facebook, Instagram, Twitter, Youtube, MessageCircle },
  data() {
    return {
      footer: {
        site_name: '',
        satuan_kerja: '',
        logo_url: null,
        address: '',
        phone: '',
        email: '',
        facebook: '',
        instagram: '',
        twitter: '',
        youtube: '',
        whatsapp: '',
        footer_text: '',
      },
    }
  },
  mounted() {
    this.fetchFooterData()
  },
  methods: {
    async fetchFooterData() {
      try {
        const response = await axios.get('/api/settings/footer')
        if (response.data.status === 'success') {
          this.footer = response.data.data
        }
      } catch (error) {
        console.error('Gagal memuat data footer:', error)
      }
    },
  },
}
</script>
