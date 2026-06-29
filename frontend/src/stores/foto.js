import { defineStore } from 'pinia'
import axios from '@/utils/api'

export const useFotoStore = defineStore('foto', {
  state: () => ({
    fotos: [],
    loading: false,
    error: null,
  }),

  actions: {
    async fetchFotos() {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get('/api/fotos')
        this.fotos = res.data
      } catch (err) {
        this.error = 'Gagal memuat data foto'
      } finally {
        this.loading = false
      }
    },
  },
})
