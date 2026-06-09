<template>
  <div class="relative" @mouseenter="open" @mouseleave="close">
    <!-- Jika punya anak -->
    <template v-if="hasChildren">
      <button
        type="button"
        class="flex items-center space-x-1 px-2 py-1 focus:outline-none"
        :class="[isScrolled ? 'text-white' : 'text-white']"
        @click.prevent="toggle"
        :aria-expanded="isOpen.toString()"
      >
        <span>{{ item.title }}</span>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-4 w-4"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M19 9l-7 7-7-7"
          />
        </svg>
      </button>

      <!-- Dropdown anak -->
      <div
        v-show="isOpen"
        class="absolute left-0 top-full mt-0 bg-green-600 shadow-lg rounded-md min-w-[200px] z-50"
      >
        <ul class="py-1">
          <li v-for="child in item.children" :key="child.id" class="px-3 py-2 hover:bg-green-700">
            <MenuItem :item="child" :is-scrolled="isScrolled" />
          </li>
        </ul>
      </div>
    </template>

    <!-- Jika tidak punya anak -->
    <template v-else>
      <!-- Link eksternal -->
      <template v-if="item.link_type === 'eksternal'">
        <a
          :href="resolveUrl(item)"
          target="_blank"
          rel="noopener noreferrer"
          class="px-2 py-1 block whitespace-nowrap"
          :class="[
            isScrolled ? 'text-white hover:text-gray-100' : 'text-white hover:text-gray-100',
          ]"
        >
          {{ item.title }}
        </a>
      </template>

      <!-- Link internal -->
      <template v-else-if="item.link_type && item.link_type !== 'parent'">
        <a
          :href="resolveUrl(item)"
          class="px-2 py-1 block whitespace-nowrap"
          :class="[
            isScrolled ? 'text-white hover:text-gray-100' : 'text-white hover:text-gray-100',
          ]"
        >
          {{ item.title }}
        </a>
      </template>

      <!-- Induk tanpa link -->
      <template v-else>
        <span
          class="px-2 py-1 block cursor-default"
          :class="[isScrolled ? 'text-white' : 'text-white']"
        >
          {{ item.title }}
        </span>
      </template>
    </template>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import MenuItem from './MenuItem.vue'

const props = defineProps({
  item: { type: Object, required: true },
  isScrolled: { type: Boolean, default: false },
})

const isOpen = ref(false)
let closeTimer = null

const hasChildren = computed(
  () => props.item && props.item.children && props.item.children.length > 0,
)

const open = () => {
  if (closeTimer) clearTimeout(closeTimer)
  isOpen.value = true
}

const close = () => {
  closeTimer = setTimeout(() => {
    isOpen.value = false
    closeTimer = null
  }, 150)
}

const toggle = () => {
  isOpen.value = !isOpen.value
}

const resolveUrl = (item) => {
  switch (item.link_type) {
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
    case 'eksternal':
      return item.url || '#'
    default:
      return '#'
  }
}
</script>
