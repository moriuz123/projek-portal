// src/stores/kecamatan.js
import { defineStore } from 'pinia'
import { ref } from 'vue'
import axios from 'axios'

export const useKecamatanStore = defineStore('kecamatan', () => {
  const kecamatans = ref([])
  const loading = ref(true)

  const fetchKecamatan = async () => {
    loading.value = true
    try {
      const res = await axios.get('/api/kecamatan')
      kecamatans.value = res.data.data || []
    } catch (error) {
      console.error('Error fetching kecamatan:', error)
    } finally {
      loading.value = false
    }
  }

  const getKecamatanBySlug = async (slug) => {
    loading.value = true
    try {
      const res = await axios.get(`/api/kecamatan/${slug}`)
      return res.data.data || null
    } catch (error) {
      console.error('Error fetching kecamatan detail:', error)
      return null
    } finally {
      loading.value = false
    }
  }

  return { kecamatans, loading, fetchKecamatan, getKecamatanBySlug }
})
