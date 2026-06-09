<template>
  <aside class="hidden lg:block lg:sticky lg:top-24">
    <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 space-y-4">
      <h2 class="font-semibold text-gray-800 text-lg border-b pb-2 mb-2">Daftar OPD</h2>

      <!-- Loading state (khusus daftar) -->
      <div v-if="loadingList" class="text-gray-400 text-sm">Memuat data...</div>

      <!-- Error state (khusus daftar) -->
      <div v-else-if="errorList" class="text-red-500 text-sm">{{ errorList }}</div>

      <!-- Data list -->
      <ul v-else class="space-y-2">
        <li
          v-for="opd in opds"
          :key="opd.slug"
          class="transition-all duration-200 hover:translate-x-1"
        >
          <router-link
            :to="`/opd/${opd.slug}`"
            class="flex items-center text-gray-700 hover:text-green-600 font-medium text-sm"
            active-class="router-link-active"
          >
            <span class="w-2 h-2 bg-green-500 rounded-full mr-2"></span>
            {{ opd.nama }}
          </router-link>
        </li>
      </ul>
    </div>
  </aside>
</template>

<script setup>
import { onMounted } from 'vue'
import { useOpdStore } from '@/stores/opd'
import { storeToRefs } from 'pinia'

const opdStore = useOpdStore()
const { opds, loadingList, errorList } = storeToRefs(opdStore)

// load sekali jika belum ada data
onMounted(() => {
  if (!opds.value || !opds.value.length) {
    opdStore.fetchOpds()
  }
})
</script>

<style scoped>
aside a.router-link-active {
  color: #16a34a; /* hijau utama */
  font-weight: 600;
}
</style>
