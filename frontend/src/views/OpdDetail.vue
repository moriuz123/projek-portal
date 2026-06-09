<template>
  <div>
    <!-- 🌿 Page Header -->
    <PageHeader
      :title="opdStore.opdDetail?.nama || 'Detail OPD'"
      :breadcrumbs="[
        { label: 'Home', link: '/' },
        { label: 'OPD', link: '/opd' },
        { label: opdStore.opdDetail?.nama || 'Detail', link: '#' },
      ]"
    />

    <!-- 🌿 Konten Utama + Sidebar -->
    <div class="page-container">
      <main class="page-main">
        <div v-if="opdStore.loading" class="page-loading-placeholder">Memuat detail OPD...</div>

        <div v-else-if="opdStore.error" class="text-center text-red-500">
          {{ opdStore.error }}
        </div>

        <article
          v-else-if="opdStore.opdDetail"
          class="page-content border-t-4 border-primary rounded-lg shadow-sm bg-white overflow-hidden"
        >
          <!-- 📸 Foto Header -->
          <div v-if="opdStore.opdDetail.foto_kantor" class="w-full">
            <img
              :src="`/storage/${opdStore.opdDetail.foto_kantor}`"
              alt="Foto Kantor"
              class="w-full h-72 object-cover"
            />
          </div>

          <!-- 🏢 Info Umum -->
          <div class="p-6 space-y-8">
            <div class="text-center border-b pb-4">
              <h1 class="text-2xl font-bold text-primary">
                {{ opdStore.opdDetail.nama }}
              </h1>
              <p class="text-gray-500 italic">({{ opdStore.opdDetail.singkatan }})</p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
              <!-- 📞 Kontak dan Info -->
              <div class="space-y-6">
                <section>
                  <h2 class="text-lg font-semibold text-gray-800 mb-3">Informasi Kontak</h2>
                  <ul class="space-y-2 text-gray-700">
                    <li class="flex items-start space-x-3">
                      <MapPin class="w-5 h-5 text-primary mt-1" />
                      <span>{{ opdStore.opdDetail.alamat || '-' }}</span>
                    </li>
                    <li class="flex items-start space-x-3">
                      <Phone class="w-5 h-5 text-primary mt-1" />
                      <span>{{ opdStore.opdDetail.telepon || '-' }}</span>
                    </li>
                    <li class="flex items-start space-x-3">
                      <Mail class="w-5 h-5 text-primary mt-1" />
                      <span>
                        <a
                          v-if="opdStore.opdDetail.email"
                          :href="`mailto:${opdStore.opdDetail.email}`"
                          class="hover:underline"
                        >
                          {{ opdStore.opdDetail.email }}
                        </a>
                        <span v-else>-</span>
                      </span>
                    </li>
                    <li class="flex items-start space-x-3">
                      <Globe class="w-5 h-5 text-primary mt-1" />
                      <span>
                        <a
                          v-if="opdStore.opdDetail.website"
                          :href="opdStore.opdDetail.website"
                          target="_blank"
                          class="hover:underline"
                        >
                          {{ opdStore.opdDetail.website }}
                        </a>
                        <span v-else>-</span>
                      </span>
                    </li>
                  </ul>
                </section>

                <section>
                  <h2 class="text-lg font-semibold text-gray-800 mb-3">Deskripsi</h2>
                  <p>{{ opdStore.opdDetail.deskripsi || 'Belum ada deskripsi.' }}</p>
                </section>

                <section>
                  <h2 class="text-lg font-semibold text-gray-800 mb-3">Pimpinan</h2>
                  <p>{{ opdStore.opdDetail.pimpinan || 'Belum ada pimpinan.' }}</p>
                </section>
              </div>

              <!-- 🗺️ Peta Lokasi -->
              <div v-if="opdStore.opdDetail.peta_embed">
                <h2 class="text-lg font-semibold text-gray-800 mb-3">Peta Lokasi</h2>
                <div
                  class="rounded-lg overflow-hidden border h-80"
                  v-html="opdStore.opdDetail.peta_embed"
                ></div>
              </div>
            </div>
          </div>

          <!-- 🗺️ Peta versi fullwidth di bawah -->
          <div
            v-if="!opdStore.opdDetail.peta_embed"
            class="bg-gray-100 text-center text-gray-500 py-6"
          >
            Peta belum tersedia
          </div>
        </article>

        <div v-else class="page-loading-placeholder">Data tidak ditemukan</div>
      </main>

      <!-- 🧭 Sidebar -->
      <div class="page-sidebar">
        <SidebarOpdDetil />
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useOpdStore } from '@/stores/opd'
import PageHeader from '@/components/PageHeader.vue'
import SidebarOpdDetil from '@/components/SidebarOpdDetil.vue'
import { MapPin, Phone, Mail, Globe } from 'lucide-vue-next'

const route = useRoute()
const opdStore = useOpdStore()

onMounted(() => {
  opdStore.fetchOpdBySlug(route.params.slug)
})

watch(
  () => route.params.slug,
  (newSlug, oldSlug) => {
    if (newSlug && newSlug !== oldSlug) {
      opdStore.fetchOpdBySlug(newSlug)
    }
  },
)
</script>
