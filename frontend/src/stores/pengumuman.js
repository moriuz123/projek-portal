import { defineStore } from 'pinia'
import axios from 'axios'

export const usePengumumanStore = defineStore('pengumumanStore', {
  state: () => ({
    list: [],
    loading: false,
    error: null,

    // Pagination
    currentPage: 1,
    perPage: 8,

    // Search
    searchQuery: '',
  }),

  getters: {
    filteredPengumuman(state) {
      if (!state.searchQuery) return state.list
      const q = state.searchQuery.toLowerCase()

      return state.list.filter(
        (item) =>
          (item.judul || '').toLowerCase().includes(q) ||
          (item.isi || '').toLowerCase().includes(q),
      )
    },

    totalPages(state) {
      return Math.ceil(this.filteredPengumuman.length / state.perPage)
    },

    paginatedPengumuman(state) {
      const start = (state.currentPage - 1) * state.perPage
      return this.filteredPengumuman.slice(start, start + state.perPage)
    },
  },

  actions: {
    async fetchPengumuman() {
      this.loading = true
      this.error = null

      try {
        const response = await axios.get('/api/pengumuman')
        this.list = response.data.data
      } catch (err) {
        this.error = 'Gagal mengambil data pengumuman.'
        console.error(err)
      } finally {
        this.loading = false
      }
    },

    nextPage() {
      if (this.currentPage < this.totalPages) this.currentPage++
    },

    prevPage() {
      if (this.currentPage > 1) this.currentPage--
    },

    goToPage(page) {
      this.currentPage = page
    },
  },
})
