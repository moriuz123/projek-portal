<template>
  <section class="relative w-full h-screen overflow-hidden">
    <!-- Background carousel -->
    <div class="absolute inset-0 z-0">
      <transition-group name="fade">
        <img
          v-if="heroSlides.length > 0"
          :key="currentImage"
          :src="`/storage/${heroSlides[currentImage]?.gambar}`"
          alt="Hero background"
          class="w-full h-full object-cover absolute transition-opacity duration-1000"
        />
      </transition-group>

      <div class="absolute inset-0 bg-gray-700 bg-opacity-50"></div>
    </div>

    <!-- Hero content -->
    <div
      class="relative z-10 h-full flex flex-col justify-center items-center text-white text-center px-4"
    >
      <!-- Foto Bupati -->
      <img
        v-if="fotoBupati"
        :src="fotoBupati"
        alt="Bupati dan Wakil Bupati"
        class="h-80 md:h-[28rem] object-contain animate-soft-bounce mt-[-40px]"
      />

      <!-- Judul -->
      <h4 class="text-3xl md:text-3xl font-bold mb-4 drop-shadow-lg text-white">
        <span class="text-green-600">Selamat Datang</span> di Portal Resmi
        <p class="text-white">Pemerintah Kabupaten Lebak</p>
      </h4>

      <!-- Form Pencarian -->
      <div class="w-full max-w-xl mt-4">
        <form @submit.prevent="doSearch" class="flex">
          <input
            v-model="searchQuery"
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

      <!-- Icon menu -->
      <div class="grid grid-cols-3 md:grid-cols-6 gap-2 mt-8">
        <a
          v-for="(item, index) in menus"
          :key="index"
          :href="resolveUrl(item)"
          class="flex flex-col items-center text-sm group"
          target="_blank"
          rel="noopener noreferrer"
          :title="item.title"
        >
          <div
            class="bg-white text-green-600 p-4 rounded-xl shadow-md transform transition-all duration-300 group-hover:scale-110 group-hover:shadow-lg group-hover:shadow-green-300"
          >
            <component :is="getIcon(item.icon)" class="h-7 w-7" stroke="currentColor" />
          </div>
          <span class="mt-2 text-white text-center">{{ item.title }}</span>
        </a>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import axios from '@/utils/api'
import { useSettingsStore } from '@/stores/settings'

// === Import Lucide ===
import * as LucideIcons from 'lucide-vue-next'
const DefaultIcon = LucideIcons.HelpCircle

// === Import Heroicons ===
import * as HeroiconsOutline from '@heroicons/vue/24/outline'
import * as HeroiconsSolid from '@heroicons/vue/24/solid'

// Router
const router = useRouter()

const settingsStore = useSettingsStore()

// Format nama untuk Lucide
const formatIconNameLucide = (name) => {
  if (!name) return ''
  return name
    .replace(/[-_]/g, ' ')
    .toLowerCase()
    .replace(/\b\w/g, (l) => l.toUpperCase())
    .replace(/\s+/g, '')
}

// Ambil icon sesuai nama (Heroicon atau Lucide)
const getIcon = (name) => {
  if (!name) return DefaultIcon

  // Cek Heroicons
  if (name.startsWith('heroicon-o-') || name.startsWith('heroicon-s-')) {
    const parts = name.split('-')
    const style = parts[1] // o atau s
    const iconName =
      parts
        .slice(2)
        .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
        .join('') + 'Icon'

    if (style === 'o' && HeroiconsOutline[iconName]) {
      return HeroiconsOutline[iconName]
    } else if (style === 's' && HeroiconsSolid[iconName]) {
      return HeroiconsSolid[iconName]
    }
    console.warn(`Heroicon "${name}" tidak ditemukan, fallback ke DefaultIcon.`)
    return DefaultIcon
  }

  // Cek Lucide
  const formatted = formatIconNameLucide(name)
  if (formatted && LucideIcons[formatted]) {
    return LucideIcons[formatted]
  }

  console.warn(`Icon "${name}" tidak ditemukan di Heroicons/Lucide, fallback ke DefaultIcon.`)
  return DefaultIcon
}

// === Hero Slider ===
const heroSlides = ref([])
const currentImage = ref(0)

const fetchHeroSlides = async () => {
  try {
    const res = await axios.get('/api/hero-sliders')
    heroSlides.value = res.data
  } catch (err) {
    console.error('Gagal mengambil hero slider:', err)
  }
}

// === Menu ===
const menus = ref([])

const fetchMenus = async () => {
  try {
    const res = await axios.get('/api/menus/front')
    menus.value = res.data.data || []
  } catch (err) {
    console.error('Gagal mengambil menu:', err)
  }
}

// === Resolve URL ===
const resolveUrl = (item) => {
  switch (item.link_type) {
    case 'eksternal':
      return item.url || '#'
    case 'home':
      return '/'
    case 'halaman_statis':
      return `/page/${item.slug || item.link_ref}`
    case 'kategori_berita':
      return `/berita/kategori/${item.slug || item.link_ref}`
    case 'kategori_dokumen':
      return `/dokumen/kategori/${item.slug || item.link_ref}`
    case 'modul':
      return `/${item.link_ref}`
    default:
      return item.link_ref || '#'
  }
}

// === Foto Bupati ===
const fotoBupati = computed(() => settingsStore.data?.photo_bupati || null)

// === Search ===
const searchQuery = ref('')

const doSearch = () => {
  if (searchQuery.value.trim()) {
    router.push({ name: 'SearchPage', query: { q: searchQuery.value } })
  }
}

onMounted(() => {
  fetchHeroSlides()
  fetchMenus()

  setInterval(() => {
    if (heroSlides.value.length > 0) {
      currentImage.value = (currentImage.value + 1) % heroSlides.value.length
    }
  }, 5000)
})
</script>
