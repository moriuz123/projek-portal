import { defineStore } from 'pinia'
import axios from 'axios'

export const useKritikSaranStore = defineStore('kritikSaran', {
  state: () => ({
    loading: false,
    message: '',
    success: false,
  }),

  actions: {
    async kirimKritikSaran(formData) {
      this.loading = true
      this.message = ''
      this.success = false

      try {
        await axios.post('/api/kritik-saran', formData)
        this.success = true
        this.message = 'Terima kasih atas kritik dan saran Anda!'
      } catch (error) {
        console.error('Gagal mengirim kritik & saran:', error)
        this.success = false
        this.message = 'Terjadi kesalahan saat mengirim data.'
      } finally {
        this.loading = false
      }
    },
  },
})
