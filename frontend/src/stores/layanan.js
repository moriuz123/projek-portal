import { defineStore } from 'pinia'
import axios from '@/utils/api'

export const useLayananStore = defineStore('layanan', {
  state: () => ({
    layanan: [],
    layananDetail: null,
    loading: false,
    error: null,
  }),

  actions: {
    async fetchLayanan() {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get('/api/layanan')
        this.layanan = res.data
      } catch (err) {
        console.error('Gagal memuat data layanan:', err)
        this.error = 'Gagal memuat data layanan'
      } finally {
        this.loading = false
      }
    },

    async fetchLayananDetail(slug) {
      this.loading = true
      this.error = null

      // ⭐ Reset dulu data lama
      this.layananDetail = null

      try {
        const res = await axios.get(`/api/layanan/${slug}`)

        // ⭐ Tambahkan prefix /storage jika backend hanya kirim nama file
        const data = res.data

        if (data.cover && !data.cover.startsWith('http') && !data.cover.startsWith('/storage')) {
          data.cover = `/storage/${data.cover}`
        }

        this.layananDetail = data
      } catch (err) {
        console.error('Gagal memuat detail layanan:', err)
        this.error = 'Gagal memuat detail layanan'
      } finally {
        this.loading = false
      }
    },
  },
})
