// /src/stores/opd.js
import { defineStore } from 'pinia'
import axios from '@/utils/api'

export const useOpdStore = defineStore('opd', {
  state: () => ({
    opds: [],
    opdDetail: null, // ✅ konsisten, bukan selectedOpd
    loading: false,
    error: null,
  }),
  actions: {
    async fetchOpds() {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get('/api/opds')
        this.opds = res.data
      } catch (err) {
        this.error = 'Gagal mengambil data OPD'
      } finally {
        this.loading = false
      }
    },
    async fetchOpdBySlug(slug) {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get(`/api/opds/${slug}`)
        this.opdDetail = res.data // ✅ simpan ke opdDetail
      } catch (err) {
        this.error = 'Gagal mengambil detail OPD'
      } finally {
        this.loading = false
      }
    },
  },
})
