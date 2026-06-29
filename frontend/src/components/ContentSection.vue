<template>
  <section class="bg-white py-10">
    <div class="max-w-screen-xl mx-auto px-4">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- =========================
             KOLOM BERITA
             ========================= -->
        <div class="lg:col-span-2">
          <div class="flex items-center justify-between border-b pb-2 mb-4">
            <h2 class="text-xl font-semibold flex items-center gap-2 text-gray-800">
              📰 Berita Terkini
            </h2>
            <router-link to="/berita" class="text-green-600 font-bold hover:underline text-sm">
              Lihat Semua
            </router-link>
          </div>

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <!-- BERITA UTAMA -->
            <div
              v-if="featured"
              class="col-span-1 group cursor-pointer"
              @click="$router.push(`/berita/${featured.slug}`)"
              title="Baca Selengkapnya"
            >
              <img
                :src="featured.image"
                alt="Featured News"
                class="w-full h-72 object-cover rounded-lg shadow-md transition-transform duration-300 group-hover:scale-105"
              />
              <div class="mt-4">
                <h2
                  class="text-lg font-semibold mb-1 text-gray-900 leading-snug group-hover:text-green-600 transition"
                >
                  {{ featured.title }}
                </h2>
                <p class="text-xs text-gray-500 mb-2 italic">
                  {{ formatDate(featured.date, { month: 'long' }) }}
                </p>
                <p class="text-gray-700 text-sm leading-relaxed line-clamp-3">
                  {{ featured.excerpt }}
                </p>
                <router-link
                  :to="`/berita/${featured.slug}`"
                  class="mt-3 inline-block text-green-600 font-semibold hover:underline text-sm"
                >
                  Baca Selengkapnya →
                </router-link>
              </div>
            </div>

            <!-- LIST BERITA -->
            <div class="space-y-5 col-span-1">
              <div
                v-for="(news, index) in latestNews"
                :key="index"
                class="flex items-start gap-4 border-b border-gray-200 pb-3 hover:bg-gray-50 rounded-lg cursor-pointer transition duration-200"
                @click="$router.push(`/berita/${news.slug}`)"
                title="Baca Berita"
              >
                <img
                  :src="news.image"
                  alt="News Thumbnail"
                  class="w-24 h-20 object-cover rounded-md flex-shrink-0 shadow-sm"
                />
                <div class="flex flex-col justify-center">
                  <h3
                    class="text-sm font-medium leading-tight text-gray-800 line-clamp-2 hover:text-green-600 transition"
                  >
                    {{ news.title }}
                  </h3>
                  <p class="text-xs text-gray-500 mt-1">
                    {{ formatDate(news.date) }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- =========================
             KOLOM BANNER
             ========================= -->
        <div v-if="banners.length">
          <div class="flex items-center justify-between border-b pb-2 mb-4">
            <h2 class="text-xl font-semibold flex items-center gap-2 text-gray-800">🏞️ Banner</h2>
            <button @click="nextBanner" class="text-green-600 font-bold hover:underline text-sm">
              Ganti →
            </button>
          </div>

          <div class="relative overflow-hidden rounded-lg shadow-md aspect-square">
            <img
              :src="banners[previousBanner]"
              alt="Banner Previous"
              class="absolute inset-0 w-full h-full object-cover transition-opacity duration-700 ease-in-out"
              :class="{
                'opacity-0': currentBanner === previousBanner,
                'opacity-100': currentBanner !== previousBanner,
              }"
            />
            <img
              :src="banners[currentBanner]"
              alt="Banner Current"
              class="absolute inset-0 w-full h-full object-cover transition-opacity duration-700 ease-in-out"
              :class="{
                'opacity-100': currentBanner === previousBanner,
                'opacity-0': currentBanner !== previousBanner,
              }"
            />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { useBeritaStore } from '@/stores/useBeritaStore'
import { onMounted, ref } from 'vue'
import axios from '@/utils/api'
import { formatDate, getStorageUrl } from '@/utils/helpers'

export default {
  name: 'ContentSection',
  setup() {
    const beritaStore = useBeritaStore()
    const featured = ref(null)
    const latestNews = ref([])
    const banners = ref([])
    const currentBanner = ref(0)
    const previousBanner = ref(0)
    let bannerInterval = null

    const fetchData = async () => {
      await beritaStore.fetchBeritas()
      if (beritaStore.beritas.length > 0) {
        const data = beritaStore.beritas
        featured.value = {
          image: getStorageUrl(data[0].thumbnail),
          title: data[0].judul,
          date: data[0].tanggal_publish,
          excerpt: data[0].excerpt ?? '',
          slug: data[0].slug,
        }
        latestNews.value = data.slice(1, 5).map((item) => ({
          image: getStorageUrl(item.thumbnail),
          title: item.judul,
          date: item.tanggal_publish,
          slug: item.slug,
        }))
      }

      const bannerRes = await axios.get('/api/banner?kategori=ucapan')
      if (Array.isArray(bannerRes.data)) {
        banners.value = bannerRes.data.map((item) => getStorageUrl(item.gambar))
      }
    }

    const nextBanner = () => {
      previousBanner.value = currentBanner.value
      currentBanner.value = (currentBanner.value + 1) % banners.value.length
    }

    onMounted(() => {
      fetchData()
      bannerInterval = setInterval(nextBanner, 5000)
    })

    return {
      featured,
      latestNews,
      banners,
      currentBanner,
      previousBanner,
      nextBanner,
      formatDate,
    }
  },
}
</script>
