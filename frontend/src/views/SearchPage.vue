<template>
  <div>
    <!-- Page Header -->
    <PageHeader
      title="Hasil Pencarian"
      subtitle="Temukan berita, dokumen, layanan, pengumuman, agenda, OPD, aplikasi, dan kecamatan terkait"
    />

    <!-- Form pencarian -->
    <div class="container mx-auto px-4 mt-6">
      <form @submit.prevent="doSearch" class="flex max-w-xl mx-auto mb-8">
        <input
          v-model="q"
          type="text"
          placeholder="Cari informasi di sini..."
          class="flex-grow px-4 py-3 rounded-l-lg text-gray-800 focus:outline-none focus:ring focus:ring-green-500"
        />
        <button
          type="submit"
          class="px-6 py-3 bg-green-600 hover:bg-green-700 text-white font-semibold rounded-r-lg shadow"
        >
          Cari
        </button>
      </form>
    </div>

    <!-- Isi konten -->
    <div class="container mx-auto py-6 px-4">
      <h1 class="text-2xl font-bold mb-6">Hasil Pencarian: "{{ q }}"</h1>

      <div v-if="loading">Sedang mencari...</div>
      <div v-else>
        <div v-if="hasResults">
          <!-- Berita -->
          <div v-if="results.berita.length">
            <h2 class="text-xl font-semibold mb-2">Berita</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.berita" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/berita/${item.slug}`" class="text-green-600 font-medium">
                  {{ item.judul }}
                </router-link>
              </li>
            </ul>
          </div>

          <!-- Dokumen -->
          <div v-if="results.dokumen.length">
            <h2 class="text-xl font-semibold mb-2">Dokumen</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.dokumen" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/dokumen/${item.slug}`" class="text-green-600 font-medium">
                  {{ item.judul }}
                </router-link>
              </li>
            </ul>
          </div>

          <!-- OPD -->
          <div v-if="results.opd.length">
            <h2 class="text-xl font-semibold mb-2">OPD</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.opd" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/opd/${item.slug}`" class="text-green-600 font-medium">
                  {{ item.nama }}
                </router-link>
              </li>
            </ul>
          </div>

          <!-- Pengumuman -->
          <div v-if="results.pengumuman.length">
            <h2 class="text-xl font-semibold mb-2">Pengumuman</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.pengumuman" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/pengumuman/${item.slug}`" class="text-green-600 font-medium">
                  {{ item.judul }}
                </router-link>
              </li>
            </ul>
          </div>

          <!-- Agenda -->
          <div v-if="results.agenda.length">
            <h2 class="text-xl font-semibold mb-2">Agenda</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.agenda" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/agenda/${item.slug}`" class="text-green-600 font-medium">
                  {{ item.judul }}
                </router-link>
                <div class="text-sm text-gray-600 mt-1">
                  {{ item.tanggal_mulai }} - {{ item.tanggal_selesai }}
                </div>
              </li>
            </ul>
          </div>

          <!-- Layanan -->
          <div v-if="results.layanan.length">
            <h2 class="text-xl font-semibold mb-2">Layanan</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.layanan" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/layanan/${item.id}`" class="text-green-600 font-medium">
                  {{ item.judul }}
                </router-link>
              </li>
            </ul>
          </div>

          <!-- ✅ Penambahan modul DataAplikasi -->
          <div v-if="results.aplikasi && results.aplikasi.length">
            <h2 class="text-xl font-semibold mb-2">Aplikasi</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.aplikasi" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/aplikasi/${item.slug}`" class="text-green-600 font-medium">
                  {{ item.nama }}
                </router-link>
                <p class="text-gray-600 text-sm mt-1">{{ item.deskripsi }}</p>
              </li>
            </ul>
          </div>
          <!-- ✅ Akhir penambahan modul DataAplikasi -->

          <!-- ✅ Penambahan modul Kecamatan -->
          <div v-if="results.kecamatan && results.kecamatan.length">
            <h2 class="text-xl font-semibold mb-2">Kecamatan</h2>
            <ul class="mb-6 space-y-2">
              <li v-for="item in results.kecamatan" :key="item.id" class="p-4 border rounded">
                <router-link :to="`/kecamatan/${item.slug}`" class="text-green-600 font-medium">
                  {{ item.nama }}
                </router-link>
                <p class="text-gray-600 text-sm mt-1">{{ item.keterangan }}</p>
              </li>
            </ul>
          </div>
          <!-- ✅ Akhir penambahan modul Kecamatan -->
        </div>

        <!-- Tidak ada hasil -->
        <div v-else class="text-gray-600">Hasil tidak ditemukan.</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch, onMounted, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from '@/utils/api'
import PageHeader from '@/components/PageHeader.vue'

const route = useRoute()
const router = useRouter()

const q = ref(route.query.q || '')
const results = ref({
  berita: [],
  dokumen: [],
  opd: [],
  layanan: [],
  pengumuman: [],
  agenda: [],
  aplikasi: [], // ✅ Penambahan modul DataAplikasi
  kecamatan: [], // ✅ Penambahan modul Kecamatan
})
const loading = ref(false)

const hasResults = computed(
  () =>
    results.value.berita.length ||
    results.value.dokumen.length ||
    results.value.opd.length ||
    results.value.layanan.length ||
    results.value.pengumuman.length ||
    results.value.agenda.length ||
    results.value.aplikasi.length || // ✅ DataAplikasi
    results.value.kecamatan.length, // ✅ Kecamatan
)

const fetchResults = async () => {
  if (!q.value) return
  loading.value = true
  try {
    const res = await axios.get(`/api/search?q=${encodeURIComponent(q.value)}`)
    results.value = res.data
  } catch (err) {
    console.error('Gagal mencari:', err)
  } finally {
    loading.value = false
  }
}

const doSearch = () => {
  if (q.value.trim()) {
    router.push({ name: 'SearchPage', query: { q: q.value } })
  }
}

watch(
  () => route.query.q,
  (newQ) => {
    q.value = newQ || ''
    fetchResults()
  },
)

onMounted(fetchResults)
</script>
