<template>
  <div>
    <PageHeader title="Daftar Video" />

    <div class="max-w-6xl mx-auto px-4 py-10">
      <!-- Filter Dropdown -->
      <div class="mb-6 flex justify-end">
        <select
          v-model="selectedCategory"
          @change="filterByCategory"
          class="border rounded-lg px-3 py-2 text-sm"
        >
          <option value="">Semua Kategori</option>
          <option
            v-for="(vidio, index) in uniqueCategories"
            :key="index"
            :value="vidio.kategori?.id_kategori_vidio"
          >
            {{ vidio.kategori?.nama_kategori_vidio }}
          </option>
        </select>
      </div>

      <!-- Loading -->
      <div v-if="loading" class="text-center text-gray-500 text-lg">Loading...</div>

      <!-- List Video -->
      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div
          v-for="vidio in filteredVidios"
          :key="vidio.id"
          class="bg-white rounded-lg shadow-md overflow-hidden"
        >
          <iframe
            class="w-full h-56"
            :src="`https://www.youtube.com/embed/${vidio.sumber_youtube}`"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          ></iframe>

          <div class="p-4">
            <h2 class="text-lg font-semibold mb-2">{{ vidio.judul_vidio }}</h2>

            <p class="text-xs text-gray-500 mt-2">
              Kategori: {{ vidio.kategori?.nama_kategori_vidio || '-' }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import PageHeader from '@/components/PageHeader.vue'
import { useVidioStore } from '@/stores/vidio'
import { onMounted, ref, computed } from 'vue'
import { storeToRefs } from 'pinia'

export default {
  components: { PageHeader },
  setup() {
    const vidioStore = useVidioStore()
    const { vidios, loading } = storeToRefs(vidioStore)

    const selectedCategory = ref('')

    // ambil kategori unik dari data video
    const uniqueCategories = computed(() => {
      const categories = []
      vidios.value.forEach((v) => {
        if (
          v.kategori &&
          !categories.find((c) => c.kategori?.id_kategori_vidio === v.kategori.id_kategori_vidio)
        ) {
          categories.push(v)
        }
      })
      return categories
    })

    // filter video berdasarkan kategori
    const filteredVidios = computed(() => {
      if (!selectedCategory.value) return vidios.value
      return vidios.value.filter((v) => v.kategori?.id_kategori_vidio == selectedCategory.value)
    })

    const filterByCategory = () => {
      // tidak perlu fetch ulang, cukup filter dari data yg sudah ada
    }

    onMounted(() => {
      vidioStore.fetchVidios()
    })

    return {
      vidios,
      loading,
      selectedCategory,
      uniqueCategories,
      filteredVidios,
      filterByCategory,
    }
  },
}
</script>
