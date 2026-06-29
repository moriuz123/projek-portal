import { defineStore } from 'pinia'
import axios from '@/utils/api'

export const useAplikasiStore = defineStore('aplikasi', {
  state: () => ({
    aplikasis: [],
    loading: false,
    error: null,
  }),
  actions: {
    async fetchAplikasis(params = {}) {
      this.loading = true
      this.error = null
      try {
        // endpoint sesuai backend Anda
        const response = await axios.get('/api/data-aplikasi', { params })
        this.aplikasis = response.data.data
      } catch (err) {
        this.error = err.message || 'Gagal memuat data aplikasi'
      } finally {
        this.loading = false
      }
    },
  },
})
