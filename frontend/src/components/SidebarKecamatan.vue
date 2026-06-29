<template>
  <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 space-y-4">
    <h2 class="font-semibold text-gray-800 text-lg border-b pb-2 mb-2">Daftar Kecamatan</h2>

    <div v-if="loading" class="text-gray-400 text-sm">Memuat data...</div>

    <div v-else-if="error" class="text-red-500 text-sm">{{ error }}</div>

    <ul v-else class="space-y-2">
      <li
        v-for="item in kecamatans"
        :key="item.slug"
        class="transition-all duration-200 hover:translate-x-1"
      >
        <router-link
          :to="`/kecamatan/${item.slug}`"
          class="flex items-center text-gray-700 hover:text-green-600 font-medium text-sm"
          active-class="router-link-active"
        >
          <span class="w-2 h-2 bg-green-500 rounded-full mr-2"></span>
          {{ item.nama }}
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useKecamatanStore } from '@/stores/kecamatan'
import { storeToRefs } from 'pinia'

const kecamatanStore = useKecamatanStore()
const { kecamatans, loading, error } = storeToRefs(kecamatanStore)

onMounted(() => {
  if (!kecamatans.value.length) kecamatanStore.fetchKecamatan()
})
</script>

