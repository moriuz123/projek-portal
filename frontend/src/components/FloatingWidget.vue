<template>
  <!-- Floating menu -->
  <div>
    <!-- === DESKTOP FLOATING MENU === -->
    <div class="hidden md:fixed md:right-4 md:top-1/3 md:flex md:flex-col md:gap-3 z-50">
      <div v-for="(item, index) in items" :key="index" class="relative w-[200px] flex justify-end">
        <button
          v-if="item.type !== 'link'"
          @click="handleAction(item.type)"
          class="group flex items-center bg-green-600 text-white py-3 rounded-xl transition-all duration-300 ease-in-out overflow-hidden w-[56px] hover:w-[200px]"
        >
          <component :is="item.icon" class="w-6 h-6 flex-shrink-0 mx-3" />
          <span
            class="max-w-0 opacity-0 group-hover:max-w-xs group-hover:opacity-100 transition-all duration-300 ease-in-out whitespace-nowrap"
          >
            {{ item.label }}
          </span>
        </button>

        <a
          v-else
          :href="item.link"
          class="group flex items-center bg-green-600 text-white py-3 rounded-xl transition-all duration-300 ease-in-out overflow-hidden w-[56px] hover:w-[200px]"
        >
          <component :is="item.icon" class="w-6 h-6 flex-shrink-0 mx-3" />
          <span
            class="max-w-0 opacity-0 group-hover:max-w-xs group-hover:opacity-100 transition-all duration-300 ease-in-out whitespace-nowrap"
          >
            {{ item.label }}
          </span>
        </a>
      </div>
    </div>

    <!-- === MOBILE BOTTOM MENU === -->
    <div
      class="fixed bottom-0 left-0 right-0 bg-green-600 flex justify-around items-center py-2 z-50 md:hidden shadow-[0_-2px_8px_rgba(0,0,0,0.2)]"
    >
      <div
        v-for="(item, index) in mobileItems"
        :key="'mobile-' + index"
        class="flex flex-col items-center text-white text-xs active:scale-110 transition-transform duration-150"
      >
        <button
          v-if="item.type !== 'link'"
          @click="handleAction(item.type)"
          class="flex flex-col items-center focus:outline-none"
        >
          <component :is="item.icon" class="w-6 h-6 mb-1" />
          <span>{{ item.label }}</span>
        </button>

        <a v-else :href="item.link" class="flex flex-col items-center focus:outline-none">
          <component :is="item.icon" class="w-6 h-6 mb-1" />
          <span>{{ item.label }}</span>
        </a>
      </div>
    </div>

    <!-- === MODAL ADUAN === -->
    <div
      v-if="showAduan"
      class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
    >
      <div class="bg-white rounded-lg shadow-lg w-96 p-6 relative">
        <button
          @click="showAduan = false"
          class="absolute top-2 right-2 text-gray-500 hover:text-red-600"
        >
          ✕
        </button>
        <h2 class="text-lg font-bold mb-4 text-gray-800">Pilih Kanal Aduan</h2>
        <div class="flex flex-col gap-3">
          <a
            href="https://www.lapor.go.id/instansi/pemerintah-kabupaten-lebak"
            target="_blank"
            class="aduan-btn"
            >SP4N Lapor</a
          >
          <a href="https://wbs.lebakkab.go.id/" target="_blank" class="aduan-btn"
            >WBS Inspektorat</a
          >
          <a href="https://wa.me/6281944114581" target="_blank" class="aduan-btn">Bot WhatsApp</a>
        </div>
      </div>
    </div>

    <!-- === MODAL POLLING === -->
    <div
      v-if="showPolling"
      class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
    >
      <div class="bg-white rounded-lg w-96 p-6 relative">
        <button
          @click="showPolling = false"
          class="absolute top-2 right-2 text-gray-500 hover:text-gray-700"
        >
          ✕
        </button>
        <h2 class="text-lg font-bold mb-4">Polling</h2>

        <div v-if="polling.length">
          <div v-for="p in polling" :key="p.id" class="mb-4">
            <p class="font-semibold text-gray-800 mb-2">{{ p.pertanyaan }}</p>
            <div v-for="j in p.jawaban" :key="j.id" class="ml-4 mb-1">
              <label class="flex items-center space-x-2">
                <input type="radio" :value="j.id" v-model="selected" />
                <span>{{ j.pilihan }}</span>
              </label>
            </div>
          </div>
          <button
            @click="submitPolling"
            class="mt-4 bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700"
          >
            Kirim
          </button>
        </div>
        <div v-else class="text-gray-500">Tidak ada polling aktif</div>
      </div>
    </div>

    <!-- === SIDEBAR AKSESIBILITAS === -->
    <div v-if="showDisabilitas" class="fixed inset-0 flex justify-end z-50">
      <div class="bg-white w-80 h-full shadow-lg p-6 relative overflow-y-auto">
        <button
          @click="showDisabilitas = false"
          class="absolute top-4 right-4 text-gray-500 hover:text-red-600 text-xl"
        >
          ✕
        </button>
        <h2 class="text-lg font-bold mb-6 text-green-700">Menu Aksesibilitas</h2>

        <!-- Semua fitur tetap lengkap -->
        <button @click="toggleVoiceMode" class="dis-btn">
          {{ isVoiceActive ? 'Matikan Mode Suara' : 'Aktifkan Mode Suara' }}
        </button>

        <div class="mb-4">
          <h3 class="font-semibold text-sm mb-2">Atur Ukuran Teks</h3>
          <div class="flex items-center gap-2">
            <button @click="decreaseFont" class="dis-btn w-8">-</button>
            <span class="text-sm">{{ fontSize }}%</span>
            <button @click="increaseFont" class="dis-btn w-8">+</button>
          </div>
        </div>

        <div class="mb-4">
          <h3 class="font-semibold text-sm mb-2">Atur Tinggi Baris</h3>
          <div class="flex items-center gap-2">
            <button @click="decreaseLineHeight" class="dis-btn w-8">-</button>
            <span class="text-sm">{{ lineHeight }}x</span>
            <button @click="increaseLineHeight" class="dis-btn w-8">+</button>
          </div>
        </div>

        <div class="mb-4">
          <h3 class="font-semibold text-sm mb-2">Spasi Teks</h3>
          <div class="flex gap-2">
            <button @click="setLetterSpacing('0px')" class="dis-btn">Kecil</button>
            <button @click="setLetterSpacing('2px')" class="dis-btn">Sedang</button>
            <button @click="setLetterSpacing('4px')" class="dis-btn">Besar</button>
          </div>
        </div>

        <div class="mb-4">
          <h3 class="font-semibold text-sm mb-2">Rata Tulisan</h3>
          <div class="flex gap-2">
            <button @click="setTextAlign('left')" class="dis-btn">◧</button>
            <button @click="setTextAlign('center')" class="dis-btn">☰</button>
            <button @click="setTextAlign('right')" class="dis-btn">◨</button>
            <button @click="setTextAlign('justify')" class="dis-btn">≡</button>
          </div>
        </div>

        <button @click="toggleBold" class="dis-btn">Pertebal Huruf</button>
        <button @click="toggleHighlightLinks" class="dis-btn">Sorot Tautan</button>
        <button @click="toggleMonochrome" class="dis-btn">Mode Monokrom</button>
        <button @click="toggleHighContrast" class="dis-btn">Mode Kontras Terang</button>
        <button @click="toggleBigCursor" class="dis-btn">Perbesar Kursor</button>
        <button @click="toggleReduceMotion" class="dis-btn">Animasi Dijeda</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onBeforeUnmount } from 'vue'
import { BarChart, MessageCircle, Accessibility, Pencil, Home } from 'lucide-vue-next'
import axios from '@/utils/api'

// state dan logic tetap sama dengan versi kamu
const showAduan = ref(false)
const showPolling = ref(false)
const showDisabilitas = ref(false)
const isVoiceActive = ref(false)

const polling = ref([])
const selected = ref(null)
const fontSize = ref(100)
const lineHeight = ref(1)

const items = [
  { icon: BarChart, label: 'Polling', type: 'polling' },
  { icon: MessageCircle, label: 'Aduan', type: 'aduan' },
  { icon: Accessibility, label: 'Aksesibilitas', type: 'disabilitas' },
  { icon: Pencil, label: 'Kritik & Saran', type: 'link', link: '/kritik-saran' },
]

const mobileItems = [
  { icon: BarChart, label: 'Polling', type: 'polling' },
  { icon: MessageCircle, label: 'Aduan', type: 'aduan' },
  { icon: Home, label: 'Beranda', type: 'link', link: '/' },
  { icon: Accessibility, label: 'Akses', type: 'disabilitas' },
  { icon: Pencil, label: 'Kritik', type: 'link', link: '/kritik-saran' },
]

const handleAction = async (type) => {
  if (type === 'polling') {
    showPolling.value = true
    try {
      const res = await axios.get('/api/polling')
      polling.value = res.data
    } catch (err) {
      console.error('Gagal ambil polling:', err)
    }
  } else if (type === 'aduan') {
    showAduan.value = true
  } else if (type === 'disabilitas') {
    showDisabilitas.value = true
  }
}

const submitPolling = async () => {
  if (!selected.value) return alert('Silakan pilih salah satu opsi polling!')
  try {
    await axios.post('/api/polling/vote', { id: selected.value })
    alert('Terima kasih sudah ikut polling!')
    showPolling.value = false
    selected.value = null
  } catch (err) {
    console.error('Gagal submit polling:', err)
  }
}

let utterance = null
const toggleVoiceMode = () => {
  if (isVoiceActive.value) {
    window.speechSynthesis.cancel()
    isVoiceActive.value = false
  } else {
    isVoiceActive.value = true
    utterance = new SpeechSynthesisUtterance(document.body.innerText)
    utterance.lang = 'id-ID'
    window.speechSynthesis.speak(utterance)
  }
}
onBeforeUnmount(() => window.speechSynthesis.cancel())

// === Aksesibilitas ===
const increaseFont = () => (document.body.style.fontSize = `${(fontSize.value += 10)}%`)
const decreaseFont = () => {
  if (fontSize.value > 50) document.body.style.fontSize = `${(fontSize.value -= 10)}%`
}
const increaseLineHeight = () => (document.body.style.lineHeight = lineHeight.value += 0.2)
const decreaseLineHeight = () => {
  if (lineHeight.value > 0.8) document.body.style.lineHeight = lineHeight.value -= 0.2
}
const setLetterSpacing = (v) => (document.body.style.letterSpacing = v)
const setTextAlign = (v) => (document.body.style.textAlign = v)
const toggleBold = () => document.body.classList.toggle('access-bold')
const toggleHighlightLinks = () => document.body.classList.toggle('access-highlight-links')
const toggleMonochrome = () => document.body.classList.toggle('access-monochrome')
const toggleHighContrast = () => document.body.classList.toggle('access-contrast')
const toggleBigCursor = () => document.body.classList.toggle('access-big-cursor')
const toggleReduceMotion = () => document.body.classList.toggle('access-reduce-motion')
</script>
