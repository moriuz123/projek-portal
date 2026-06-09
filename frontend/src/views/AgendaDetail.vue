<template>
  <div>
    <!-- Header -->
    <PageHeader
      :title="agenda?.judul || 'Detail Agenda'"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'Agenda', link: '/agenda' },
        { label: agenda?.judul || 'Detail', link: '#' },
      ]"
    />

    <!-- LOADING STATE -->
    <div v-if="loading" class="page-container mt-6">
      <div class="page-main">
        <div class="global-skeleton h-8 w-40 mb-4"></div>
        <div class="global-skeleton h-6 w-3/4 mb-2"></div>
        <div class="global-skeleton h-6 w-1/2 mb-6"></div>
        <div class="global-skeleton h-64 w-full mb-6"></div>
      </div>

      <aside class="page-sidebar">
        <div class="global-skeleton h-80 w-full"></div>
      </aside>
    </div>

    <!-- CONTENT -->
    <div v-if="!loading" class="page-container">
      <div v-if="agenda" class="page-main">
        <article class="page-content">
          <!-- Tanggal -->
          <div
            v-if="agenda.tanggal_mulai"
            class="w-20 h-20 bg-blue-600 text-white flex flex-col items-center justify-center rounded-lg shadow-md mb-6"
          >
            <span class="text-sm">{{ monthShort }}</span>
            <span class="text-2xl font-bold">{{ dayNum }}</span>
          </div>

          <h1 class="text-2xl font-bold text-gray-800 mb-4">
            {{ agenda.judul }}
          </h1>

          <div class="text-sm text-gray-600 space-y-1 mb-6">
            <div v-if="agenda.tanggal_mulai">📅 {{ formattedFullDate }}</div>
            <div v-if="agenda.lokasi">📍 {{ agenda.lokasi }}</div>
            <div v-if="agenda.dresscode">👔 {{ agenda.dresscode }}</div>
          </div>

          <!-- Konten Dari Backend -->
          <div class="page-body" v-html="agenda.deskripsi"></div>
        </article>
      </div>

      <!-- Sidebar -->
      <aside class="page-sidebar">
        <AgendaSidebar />
      </aside>
    </div>

    <!-- Not Found -->
    <div v-if="!loading && !agenda" class="text-center py-10 text-gray-500">
      Data agenda tidak ditemukan.
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import PageHeader from '@/components/PageHeader.vue'
import AgendaSidebar from '@/components/AgendaSidebar.vue'
import { useAgendaStore } from '@/stores/agenda'

const route = useRoute()
const store = useAgendaStore()

const agenda = ref(null)
const loading = ref(true)

async function loadDetail() {
  loading.value = true

  // Scroll smooth ke atas ketika halaman muncul
  window.scrollTo({ top: 0, behavior: 'smooth' })

  agenda.value = await store.fetchAgendaById(route.params.id)
  loading.value = false
}

onMounted(loadDetail)

// reload jika ID berubah
watch(
  () => route.params.id,
  () => loadDetail(),
)

// Format tanggal
const formattedFullDate = computed(() => {
  if (!agenda.value?.tanggal_mulai) return ''
  const d = new Date(agenda.value.tanggal_mulai)
  return new Intl.DateTimeFormat('id-ID', {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  }).format(d)
})

const monthShort = computed(() => {
  if (!agenda.value?.tanggal_mulai) return ''
  return new Intl.DateTimeFormat('id-ID', { month: 'short' })
    .format(new Date(agenda.value.tanggal_mulai))
    .toUpperCase()
})

const dayNum = computed(() => {
  if (!agenda.value?.tanggal_mulai) return ''
  return new Date(agenda.value.tanggal_mulai).getDate()
})
</script>

<!-- Tidak ada style lokal, karena semua sudah dipindahkan ke main.css -->
<style scoped></style>
