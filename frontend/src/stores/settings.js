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
          if (this.data.favicon_url) {
            let icon = document.querySelector("link[rel='icon']")

            if (!icon) {
              icon = document.createElement('link')
              icon.rel = 'icon'
              document.head.appendChild(icon)
            }

            icon.href = this.data.favicon_url + '?v=' + Date.now()
          }
        }

      } catch (error) {
        console.error('Gagal load settings:', error)
      }
    }
  }
})