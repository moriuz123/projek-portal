<template>
  <section class="py-10 bg-white">
    <div class="max-w-screen-xl mx-auto px-4">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <!-- ===========================
             KIRI: Agenda
             =========================== -->
        <div>
          <div class="flex justify-between items-center border-b pb-2 mb-4">
            <h2 class="text-xl font-semibold flex items-center gap-2">📅 Agenda</h2>
            <router-link to="/agenda" class="text-green-600 font-bold hover:underline text-sm">
              Lihat Semua
            </router-link>
          </div>

          <div v-if="loadingAgenda.value" class="text-gray-500">Memuat agenda...</div>

          <ul v-else-if="agendasLimited.length === 0" class="text-gray-600">
            Tidak ada agenda.
          </ul>

          <ul v-else class="divide-y divide-gray-200">
            <li v-for="item in agendasLimited" :key="item.id" class="flex items-center py-1.5">
              <!-- Shape Kalender Baru (Bulan, Tanggal, Tahun di dalam kotak biru) -->
              <div
                class="bg-green-600 text-white rounded-lg shadow-md w-14 h-16 flex flex-col justify-center items-center leading-tight mr-3"
              >
                <span class="text-[10px] font-bold uppercase">
                  {{ formatMonth(item.tanggal_mulai) }}
                </span>
                <span class="text-lg font-extrabold">
                  {{ formatDay(item.tanggal_mulai) }}
                </span>
                <span class="text-[10px] font-semibold">
                  {{ formatYear(item.tanggal_mulai) }}
                </span>
              </div>

              <!-- Judul Agenda -->
              <router-link
                :to="`/agenda/${item.slug || item.id}`"
                class="text-gray-800 font-medium hover:text-green-600"
              >
                {{ item.judul || item.title || '—' }}
              </router-link>
            </li>
          </ul>
        </div>

        <!-- ===========================
             KANAN: Pengumuman
             =========================== -->
        <!-- ===========================
     KANAN: Pengumuman
     =========================== -->
        <div>
          <div class="flex justify-between items-center border-b pb-2 mb-4">
            <h2 class="text-xl font-semibold flex items-center gap-2">📢 Pengumuman</h2>
            <router-link to="/pengumuman" class="text-green-600 font-bold hover:underline text-sm">
              Lihat Semua
            </router-link>
          </div>

          <div v-if="loadingPengumuman.value" class="text-gray-500">Memuat pengumuman...</div>

          <ul v-else-if="pengumumanLimited.length === 0" class="text-gray-600">
            Tidak ada pengumuman.
          </ul>

          <ul v-else class="divide-y divide-gray-200">
            <li v-for="item in pengumumanLimited" :key="item.id" class="flex items-center py-2.5">
              <!-- Kotak tanggal seperti agenda (menggunakan tgl_pelaksanaan) -->
              <div
                class="bg-green-600 text-white rounded-lg shadow-md w-14 h-16 flex flex-col justify-center items-center leading-tight mr-3"
              >
                <span class="text-[10px] font-bold uppercase">
                  {{ formatMonth(item.tgl_pelaksanaan || item.created_at) }}
                </span>
                <span class="text-lg font-extrabold">
                  {{ formatDay(item.tgl_pelaksanaan || item.created_at) }}
                </span>
                <span class="text-[10px] font-semibold">
                  {{ formatYear(item.tgl_pelaksanaan || item.created_at) }}
                </span>
              </div>

              <!-- Judul Pengumuman -->
              <router-link
                :to="`/pengumuman/${item.slug || item.id}`"
                class="text-gray-800 font-medium hover:text-green-600"
              >
                {{ item.judul || item.title || '—' }}
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'
import dayjs from 'dayjs'

const agendas = ref([])
const pengumuman = ref([])

const loadingAgenda = ref(true)
const loadingPengumuman = ref(true)

const agendasLimited = computed(() => agendas.value.slice(0, 5))
const pengumumanLimited = computed(() => pengumuman.value.slice(0, 5))

async function fetchAgendas() {
  loadingAgenda.value = true
  try {
    let res = null
    const urls = ['/api/agendas', '/api/agenda']
    for (const u of urls) {
      try {
        res = await axios.get(u)
        if (res) break
      } catch (e) {
        res = null
      }
    }
    const payload = res ? (Array.isArray(res.data) ? res.data : (res.data?.data ?? [])) : []
    agendas.value = Array.isArray(payload) ? payload : []
  } catch (err) {
    console.error('Error fetch agendas', err)
    agendas.value = []
  } finally {
    loadingAgenda.value = false
  }
}

async function fetchPengumuman() {
  loadingPengumuman.value = true
  try {
    let res = null
    const urls = ['/api/pengumuman', '/api/pengumumans', '/api/announcements']
    for (const u of urls) {
      try {
        res = await axios.get(u)
        if (res) break
      } catch (e) {
        res = null
      }
    }

    if (!res) {
      pengumuman.value = []
      return
    }

    let payload = []
    if (Array.isArray(res.data)) {
      payload = res.data
    } else if (Array.isArray(res.data?.data)) {
      payload = res.data.data
    } else {
      payload = []
    }

    pengumuman.value = Array.isArray(payload) ? payload : []
  } catch (err) {
    console.error('Error fetch pengumuman', err)
    pengumuman.value = []
  } finally {
    loadingPengumuman.value = false
  }
}

const formatDay = (date) => {
  if (!date) return ''
  const d = dayjs(date)
  return d.isValid() ? d.format('D') : ''
}

const formatMonth = (date) => {
  if (!date) return ''
  const d = dayjs(date)
  return d.isValid() ? d.format('MMM') : ''
}

const formatYear = (date) => {
  if (!date) return ''
  const d = dayjs(date)
  return d.isValid() ? d.format('YYYY') : ''
}

onMounted(() => {
  fetchAgendas()
  fetchPengumuman()
})
</script>
