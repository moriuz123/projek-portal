<!-- batas normal-->
<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Header -->
    <HeaderNav />

    <!-- Konten utama -->
    <main class="flex-grow bg-gray-100">
      <!-- padding-top sama tinggi header -->
      <router-view />
    </main>
    <FloatingWidget />
    <!-- Footer tetap -->
    <FooterSection />
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useSettingsStore } from '@/stores/settings'
import FloatingWidget from '@/components/FloatingWidget.vue'
import HeaderNav from './components/HeaderNav.vue'
import FooterSection from './components/Footer.vue'

const settingsStore = useSettingsStore()

onMounted(() => {
  settingsStore.fetchSettings()
})
</script>
