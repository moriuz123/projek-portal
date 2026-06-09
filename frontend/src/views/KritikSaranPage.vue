<template>
  <div>
    <PageHeader title="Kritik & Saran" subtitle="Kami menghargai setiap masukan dari Anda" />

    <section class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow mt-6">
      <h2 class="text-2xl font-bold mb-4 text-gray-800">Kirim Kritik & Saran Anda</h2>

      <form @submit.prevent="kirimData" class="space-y-4">
        <div>
          <label class="block font-semibold mb-1">Nama</label>
          <input v-model="form.nama" type="text" class="input-field" required />
        </div>

        <div>
          <label class="block font-semibold mb-1">Email</label>
          <input v-model="form.email" type="email" class="input-field" placeholder="opsional" />
        </div>

        <div>
          <label class="block font-semibold mb-1">Nomor HP</label>
          <input v-model="form.no_hpusr" type="text" class="input-field" placeholder="opsional" />
        </div>

        <div>
          <label class="block font-semibold mb-1">Judul</label>
          <input v-model="form.judul" type="text" class="input-field" required />
        </div>

        <div>
          <label class="block font-semibold mb-1">Isi Kritik / Saran</label>
          <textarea v-model="form.isi_kritik" rows="5" class="input-field" required></textarea>
        </div>

        <button
          type="submit"
          class="bg-green-600 hover:bg-green-700 text-white px-5 py-2 rounded transition"
          :disabled="loading"
        >
          {{ loading ? 'Mengirim...' : 'Kirim Sekarang' }}
        </button>

        <p v-if="message" :class="success ? 'text-green-600 mt-3' : 'text-red-600 mt-3'">
          {{ message }}
        </p>
      </form>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import PageHeader from '@/components/PageHeader.vue'
import axios from 'axios'

const form = ref({
  nama: '',
  email: '',
  judul: '',
  isi_kritik: '',
  no_hpusr: '',
})

const loading = ref(false)
const message = ref('')
const success = ref(false)

const kirimData = async () => {
  loading.value = true
  message.value = ''
  success.value = false

  try {
    const res = await axios.post('/api/kritik-saran', form.value)
    success.value = true
    message.value = res.data.message
    form.value = { nama: '', email: '', judul: '', isi_kritik: '', no_hpusr: '' }
  } catch (err) {
    console.error(err)
    message.value = 'Gagal mengirim data. Coba lagi nanti.'
    success.value = false
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.input-field {
  @apply w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500;
}
</style>
