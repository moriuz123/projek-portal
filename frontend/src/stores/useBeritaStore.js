// src/stores/useBeritaStore.js
import { defineStore } from 'pinia'
import axios from 'axios'

const ensureImage = (item) => {
  // jika sudah ada image (full url), pakai itu
  if (item?.image) return item.image
  // jika ada thumbnail, bangun path storage atau pakai sebagaimana adanya
  if (item?.thumbnail) {
    // jika thumbnail sudah mengandung http/https atau /storage, gunakan langsung
    if (typeof item.thumbnail === 'string') {
      if (item.thumbnail.startsWith('http') || item.thumbnail.startsWith('/storage')) {
        return item.thumbnail
      }
      return `/storage/${item.thumbnail}`
    }
  }
  // fallback default
  return '/images/default-thumbnail.jpg'
}

export const useBeritaStore = defineStore('berita', {
  state: () => ({
    beritas: [],
    beritaDetail: null,
    latest: [],
    popular: [],
    pagination: {
      current_page: 1,
      last_page: 1,
      total: 0,
    },
    loading: false,
    error: null,
  }),

  actions: {
    async fetchBeritas(page = 1) {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get(`/api/berita?page=${page}`)
        const raw = res.data.data || res.data || []
        const list = Array.isArray(raw) ? raw : []
        this.beritas = list.map((it) => ({ ...it, image: ensureImage(it) }))
        this.pagination = {
          current_page: res.data.current_page || 1,
          last_page: res.data.last_page || 1,
          total: res.data.total || this.beritas.length,
        }
      } catch (err) {
        this.error = err.response?.data?.message || 'Gagal memuat berita'
      } finally {
        this.loading = false
      }
    },

    async fetchBeritaDetail(slug) {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get(`/api/berita/${slug}`)
        const item = res.data || {}
        item.image = ensureImage(item)
        this.beritaDetail = item
      } catch (err) {
        this.error = err.response?.data?.message || 'Gagal memuat detail berita'
      } finally {
        this.loading = false
      }
    },

    async fetchLatest() {
      this.error = null
      try {
        const res = await axios.get('/api/berita-latest')
        const raw = res.data.data || res.data || []
        const list = Array.isArray(raw) ? raw : []
        this.latest = list.map((it) => ({ ...it, image: ensureImage(it) }))
      } catch (err) {
        this.error = err.response?.data?.message || 'Gagal memuat berita terbaru'
      }
    },

    async fetchPopular() {
      this.error = null
      try {
        const res = await axios.get('/api/berita-popular')
        const raw = res.data.data || res.data || []
        const list = Array.isArray(raw) ? raw : []
        this.popular = list.map((it) => ({ ...it, image: ensureImage(it) }))
      } catch (err) {
        this.error = err.response?.data?.message || 'Gagal memuat berita populer'
      }
    },
  },
})
