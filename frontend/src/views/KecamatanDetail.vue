<template>
  <div>
    <!-- 🌿 Page Header -->
    <PageHeader
      :title="kecamatan?.nama || 'Detail Kecamatan'"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'Kecamatan', link: '/kecamatan' },
        { label: kecamatan?.nama || 'Detail', link: '#' },
      ]"
    />

    <!-- 🌿 Konten Utama + Sidebar -->
    <div class="page-container">
      <main class="page-main">
        <div v-if="loading" class="page-loading-placeholder">Memuat detail kecamatan...</div>

        <div v-else-if="error" class="text-center text-red-500">{{ error }}</div>

        <!-- 💎 Card Utama -->
        <article
          v-else-if="kecamatan"
          class="page-content border-t-4 border-primary rounded-lg shadow-sm bg-white overflow-hidden"
        >
          <!-- 📸 Foto Header -->
          <div v-if="kecamatan.foto_kantor" class="w-full">
            <img
              :src="`/storage/${kecamatan.foto_kantor}`"
              alt="Foto Kantor"
              class="w-full h-72 object-cover"
            />
          </div>

          <!-- 🏢 Konten Utama -->
          <div class="p-6 space-y-8">
            <!-- Judul -->
            <div class="text-center border-b pb-4">
              <h1 class="text-2xl font-bold text-primary">{{ kecamatan.nama }}</h1>
              <p class="text-gray-500 italic">Kode: {{ kecamatan.kode_kecamatan }}</p>
            </div>

            <!-- Grid Konten -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
              <!-- 📞 Info Kontak -->
              <div class="space-y-6">
                <section>
                  <h2 class="text-lg font-semibold text-gray-800 mb-3">Informasi Kontak</h2>
                  <ul class="space-y-2 text-gray-700">
                    <li class="flex items-start space-x-3">
                      <MapPin class="w-5 h-5 text-primary mt-1" />
                      <span>{{ kecamatan.alamat_kantor || '-' }}</span>
                    </li>
                    <li class="flex items-start space-x-3">
                      <Phone class="w-5 h-5 text-primary mt-1" />
                      <span>{{ kecamatan.telepon || '-' }}</span>
                    </li>
                    <li class="flex items-start space-x-3">
                      <Mail class="w-5 h-5 text-primary mt-1" />
                      <span>
                        <a
                          v-if="kecamatan.email"
                          :href="`mailto:${kecamatan.email}`"
                          class="hover:underline"
                        >
                          {{ kecamatan.email }}
                        </a>
                        <span v-else>-</span>
                      </span>
                    </li>
                    <li class="flex items-start space-x-3">
                      <Globe class="w-5 h-5 text-primary mt-1" />
                      <span>
                        <a
                          v-if="kecamatan.website"
                          :href="kecamatan.website"
                          target="_blank"
                          class="hover:underline"
                        >
                          {{ kecamatan.website }}
                        </a>
                        <span v-else>-</span>
                      </span>
                    </li>
                  </ul>
                </section>

                <section>
                  <h2 class="text-lg font-semibold text-gray-800 mb-3">Deskripsi</h2>
                  <p>{{ kecamatan.deskripsi || 'Belum ada deskripsi.' }}</p>
                </section>

                <section>
                  <h2 class="text-lg font-semibold text-gray-800 mb-3">Nama Camat</h2>
                  <p>{{ kecamatan.nama_camat || 'Belum ada camat.' }}</p>
                </section>
              </div>

              <!-- 🗺️ Peta Lokasi -->
              <div v-if="kecamatan.peta_embed">
                <h2 class="text-lg font-semibold text-gray-800 mb-3">Peta Lokasi</h2>
                <div
                  class="rounded-lg overflow-hidden border h-80"
                  v-html="kecamatan.peta_embed"
                ></div>
              </div>
            </div>
          </div>

          <!-- 🗺️ Jika tidak ada peta -->
          <div v-if="!kecamatan.peta_embed" class="bg-gray-100 text-center text-gray-500 py-6">
            Peta belum tersedia
          </div>
        </article>

        <!-- 🚫 Jika tidak ada data -->
        <div v-else class="page-loading-placeholder">Data tidak ditemukan</div>
      </main>

      <!-- 🧭 Sidebar -->
      <div class="page-sidebar">
        <SidebarKecamatan :activeSlug="slug" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useKecamatanStore } from '@/stores/kecamatan'
import PageHeader from '@/components/PageHeader.vue'
import SidebarKecamatan from '@/components/SidebarKecamatan.vue'
import { MapPin, Phone, Mail, Globe } from 'lucide-vue-next'

const route = useRoute()
const store = useKecamatanStore()

const kecamatan = ref(null)
const loading = ref(true)
const error = ref(null)
const slug = ref(route.params.slug)

const fetchDetail = async () => {
  loading.value = true
  error.value = null
  try {
    kecamatan.value = await store.getKecamatanBySlug(slug.value)
  } catch (err) {
    error.value = 'Gagal memuat detail kecamatan.'
  } finally {
    loading.value = false
  }
}

onMounted(fetchDetail)

watch(
  () => route.params.slug,
  (newSlug, oldSlug) => {
    if (newSlug && newSlug !== oldSlug) {
      slug.value = newSlug
      fetchDetail()
    }
  },
)
</script>
