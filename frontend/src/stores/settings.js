import { defineStore } from 'pinia'
import axios from 'axios'

export const useSettingsStore = defineStore('settings', {
  state: () => ({
    data: null,
    loaded: false,
  }),

  actions: {
    async fetchSettings() {
      if (this.loaded) return

      try {
        const res = await axios.get('/api/settings/header')

        if (res.data.status === 'success') {
          this.data = res.data.data
          this.loaded = true

          // title
          if (this.data.site_name) {
            document.title = this.data.site_name
          }

          // favicon
          const faviconUrl = this.data.favicon_url || '/favicon.ico'
          let icons = document.querySelectorAll("link[rel*='icon']")

          if (icons.length === 0) {
            let icon = document.createElement('link')
            icon.rel = 'icon'
            icon.href = faviconUrl + '?v=' + Date.now()
            document.head.appendChild(icon)
          } else {
            icons.forEach(icon => {
              icon.href = faviconUrl + '?v=' + Date.now()
            })
          }
        }

      } catch (error) {
        console.error('Gagal load settings:', error)
      }
    }
  }
})