<template>
  <section class="page-header flex flex-col justify-center items-center text-center">
    <div class="overlay"></div>

    <!-- Judul -->
    <h1
      class="relative z-10 text-3xl font-bold text-white mb-2 leading-snug"
      v-html="formattedTitle"
    ></h1>

    <!-- Breadcrumb -->
    <nav class="relative z-10 text-sm text-gray-200">
      <ol class="flex space-x-2 justify-center">
        <li>
          <router-link to="/" class="hover:underline">Beranda</router-link>
        </li>
        <li>/</li>
        <li class="text-gray-300">{{ title }}</li>
      </ol>
    </nav>
  </section>
</template>

<script>
export default {
  name: 'PageHeader',
  props: {
    title: {
      type: String,
      required: true,
    },
    breakAfterWords: {
      type: Number,
      default: 6, // jumlah kata setelah itu otomatis baris baru
    },
  },
  computed: {
    formattedTitle() {
      const words = this.title.split(' ')
      if (words.length > this.breakAfterWords) {
        const firstLine = words.slice(0, this.breakAfterWords).join(' ')
        const secondLine = words.slice(this.breakAfterWords).join(' ')
        return `${firstLine}<br>${secondLine}`
      }
      return this.title
    },
  },
}
</script>
