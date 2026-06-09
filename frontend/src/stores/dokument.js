import { defineStore } from 'pinia'
import axios from 'axios'

export const useDokumentStore = defineStore('dokument', {
  state: () => ({
    dokuments: [],
    kategori: null,
    loading: false,
    error: null,
  }),
  actions: {
    async fetchDokuments() {
      this.loading = true
      this.error = null
      try {
        const response = await axios.get('/api/dokumen')
        this.dokuments = response.data
      } catch (err) {
        this.error = err.message || 'Gagal mengambil data dokumen'
      } finally {
        this.loading = false
      }
    },

    async fetchDokumentsByKategori(slug) {
      this.loading = true
      this.error = null
      try {
        const response = await axios.get(`/api/kategori-dokumen/${slug}/dokumen`)
        this.kategori = response.data.kategori
        this.dokuments = response.data.dokumen
      } catch (err) {
        this.error = err.message || 'Gagal mengambil data dokumen berdasarkan kategori'
      } finally {
        this.loading = false
      }
    },
  },
})
