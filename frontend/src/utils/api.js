import axios from 'axios'

// Centralized Axios Instance
const api = axios.create({
  baseURL: '', // Left blank to inherit absolute/relative routes correctly and use Vite proxy
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  }
})

// Optional: Interceptors can be defined here
api.interceptors.response.use(
  (response) => response,
  (error) => {
    console.error('API Error Response:', error.response || error.message)
    return Promise.reject(error)
  }
)

export default api
