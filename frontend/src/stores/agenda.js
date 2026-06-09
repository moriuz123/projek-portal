import { defineStore } from 'pinia'
import axios from 'axios'

export const useAgendaStore = defineStore('agenda', {
  state: () => ({
    agendas: [],
    loading: false,
    error: null,
  }),
  actions: {
    async fetchAgendas() {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get('/api/agendas')
        this.agendas = res.data.data
      } catch (err) {
        this.error = 'Gagal memuat data agenda'
        console.error(err)
      } finally {
        this.loading = false
      }
    },

    async fetchAgendaById(id) {
      this.loading = true
      this.error = null
      try {
        const res = await axios.get(`/api/agendas/${id}`)
        return res.data.data
      } catch (err) {
        this.error = 'Gagal memuat detail agenda'
        console.error(err)
        return null
      } finally {
        this.loading = false
      }
    },
  },
})
