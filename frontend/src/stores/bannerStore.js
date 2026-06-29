// src/stores/bannerStore.js
import { defineStore } from 'pinia'
import axios from '@/utils/api'

export const useBannerStore = defineStore('banner', {
  state: () => ({
    banners: [],
    loading: false,
    error: null,
  }),
  actions: {
    async fetchAll() {
      this.loading = true
      try {
        const res = await axios.get('/api/banner')
        this.banners = res.data
      } catch (err) {
        this.error = err
      } finally {
        this.loading = false
      }
    },
    async fetchByKategori(kategori) {
      this.loading = true
      try {
        const res = await axios.get(`/api/banner/${kategori}`)
        this.banners = res.data
      } catch (err) {
        this.error = err
      } finally {
        this.loading = false
      }
    },
  },
})
