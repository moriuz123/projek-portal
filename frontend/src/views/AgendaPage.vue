<template>
  <PageHeader title="Agenda Kegiatan" />
  <div class="max-w-7xl mx-auto px-4 py-8">
    <!-- Filter Rentang Tanggal -->
    <div class="flex flex-wrap items-center gap-4 mb-6">
      <h2 class="text-xl font-semibold">Daftar Agenda</h2>

      <div class="flex items-center gap-2">
        <label class="text-sm">Dari:</label>
        <input type="date" v-model="startDate" class="border rounded px-3 py-2 text-sm" />
      </div>
      <div class="flex items-center gap-2">
        <label class="text-sm">Sampai:</label>
        <input type="date" v-model="endDate" class="border rounded px-3 py-2 text-sm" />
      </div>
    </div>

    <!-- Tabel Agenda -->
    <div class="bg-white shadow rounded-lg p-4">
      <div v-if="agendaStore.loading" class="text-gray-500">Memuat data...</div>
      <div v-else-if="agendaStore.error" class="text-red-500">{{ agendaStore.error }}</div>
      <div v-else>
        <table class="min-w-full text-sm border border-gray-200">
          <thead class="bg-gray-100">
            <tr>
              <th class="px-3 py-2 border">Tanggal</th>
              <th class="px-3 py-2 border">Judul</th>
              <th class="px-3 py-2 border">Lokasi</th>
              <th class="px-3 py-2 border">Waktu</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="agenda in filteredAgendas" :key="agenda.id" class="hover:bg-gray-50">
              <td class="px-3 py-2 border">
                {{ formatDate(agenda.tanggal_mulai) }}
                <span
                  v-if="agenda.tanggal_selesai && agenda.tanggal_selesai !== agenda.tanggal_mulai"
                >
                  - {{ formatDate(agenda.tanggal_selesai) }}
                </span>
              </td>
              <td class="px-3 py-2 border">{{ agenda.judul }}</td>
              <td class="px-3 py-2 border">{{ agenda.lokasi }}</td>
              <td class="px-3 py-2 border">
                {{ agenda.waktu_mulai }}
                <span v-if="agenda.opsi_waktu_selesai === 'selesai'"> - s.d selesai </span>
                <span v-else-if="agenda.waktu_selesai"> - {{ agenda.waktu_selesai }} </span>
              </td>
            </tr>
            <tr v-if="filteredAgendas.length === 0">
              <td colspan="4" class="text-center py-4 text-gray-500">
                Tidak ada agenda pada rentang tanggal ini.
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, computed } from 'vue'
import { useAgendaStore } from '@/stores/agenda'
import PageHeader from '@/components/PageHeader.vue'
import { formatDate } from '@/utils/helpers'

const agendaStore = useAgendaStore()

// filter tanggal
const startDate = ref('')
const endDate = ref('')

// computed: filter berdasarkan rentang tanggal
const filteredAgendas = computed(() => {
  if (!startDate.value && !endDate.value) {
    return agendaStore.agendas
  }

  return agendaStore.agendas.filter((agenda) => {
    const agendaDate = new Date(agenda.tanggal_mulai).setHours(0, 0, 0, 0)
    const start = startDate.value ? new Date(startDate.value).setHours(0, 0, 0, 0) : null
    const end = endDate.value ? new Date(endDate.value).setHours(23, 59, 59, 999) : null

    if (start && agendaDate < start) return false
    if (end && agendaDate > end) return false
    return true
  })
})

// ambil data ketika halaman dibuka
onMounted(() => agendaStore.fetchAgendas())
</script>
