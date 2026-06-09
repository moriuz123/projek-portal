import { defineStore } from 'pinia'
import axios from 'axios'

export const useVidioStore = defineStore('vidio', {
  state: () => ({
    vidios: [],
    loading: false,
  }),
  getters: {
    // contoh: ambil kategori unik
    kategoriList: (state) => {
      const kategoriSet = new Map()
      state.vidios.forEach((v) => {
        if (v.kategori) {
          kategoriSet.set(v.kategori.id_kategori_vidio, v.kategori.nama_kategori_vidio)
        }
      })
      return Array.from(kategoriSet, ([id, nama]) => ({ id, nama }))
    },
  },
  actions: {
    async fetchVidios() {
      this.loading = true
      try {
        const res = await axios.get('/api/vidios')
        this.vidios = res.data
      } catch (error) {
        console.error('Gagal mengambil data video:', error)
      } finally {
        this.loading = false
      }
    },
  },
})
