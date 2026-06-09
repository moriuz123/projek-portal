<template>
  <div
    class="flex gap-4 items-start p-3 bg-white border rounded-lg hover:shadow-md transition-all duration-200"
  >
    <!-- Thumbnail -->
    <div class="w-28 h-20 flex-shrink-0 overflow-hidden rounded-md bg-gray-100">
      <img
        v-if="thumbnail"
        :src="resolveThumbnail(thumbnail)"
        :alt="judul || 'Thumbnail Berita'"
        class="w-full h-full object-cover"
        loading="lazy"
      />
      <div v-else class="w-full h-full flex items-center justify-center text-gray-400 text-sm">
        📷
      </div>
    </div>

    <!-- Konten -->
    <div class="flex-1">
      <!-- Judul -->
      <h2 class="text-base font-semibold text-gray-800 leading-snug mb-1 line-clamp-2">
        <router-link
          :to="`/berita/${slug}`"
          class="hover:text-green-700 transition-colors duration-150"
        >
          {{ judul }}
        </router-link>
      </h2>

      <!-- Excerpt -->
      <p v-if="excerpt" class="text-gray-600 text-sm mb-1 line-clamp-3">
        {{ excerpt }}
      </p>

      <!-- Tanggal & Kategori -->
      <div class="flex items-center gap-2 text-xs text-gray-500">
        <span>{{ formatTanggal(tanggal) }}</span>
        <span v-if="kategori" class="text-green-600 font-medium">• {{ kategori }}</span>
      </div>
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  judul: String,
  slug: String,
  thumbnail: String,
  tanggal: String,
  kategori: String,
  excerpt: String,
})

/**
 * Resolusi thumbnail, fallback ke default
 */
const resolveThumbnail = (img) => {
  if (!img) return '/images/default-thumbnail.jpg'
  const fixedPath = decodeURIComponent(img)
  return fixedPath.includes('/storage') ? fixedPath : `/storage/${fixedPath}`
}

/**
 * Format tanggal aman
 */
const formatTanggal = (tgl) => {
  if (!tgl) return 'Tanggal tidak tersedia'

  const d = new Date(tgl)
  if (isNaN(d.getTime())) return 'Tanggal tidak tersedia'

  return d.toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}
</script>
