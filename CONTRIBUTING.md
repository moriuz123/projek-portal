# Contributing Guide

Panduan ini dipakai untuk menjaga kerja tim tetap rapi di repository `projek-portal`.

## Branching

Alur branch utama:

- `main`: branch produksi/stabil. Hanya menerima PR dari `develop`.
- `develop`: branch integrasi tim. Semua branch fitur/perbaikan bermuara ke sini.
- `feature/<nama-fitur>`: pekerjaan fitur baru.
- `fix/<nama-bug>`: perbaikan bug.
- `hotfix/<nama-isu>`: perbaikan mendesak untuk produksi.
- `chore/<nama-pekerjaan>`: pekerjaan non-fitur seperti konfigurasi, dokumentasi, atau cleanup.

Contoh:

```bash
git checkout develop
git pull origin develop
git checkout -b feature/filter-berita-opd
```

## Flow Pull Request

1. Buat branch dari `develop`.
2. Commit perubahan dengan pesan yang jelas.
3. Push branch ke GitHub.
4. Buat Pull Request ke `develop`.
5. Setelah fitur di `develop` sudah siap rilis, buat PR dari `develop` ke `main`.

Jangan langsung membuat PR dari branch fitur ke `main`, kecuali disepakati sebagai hotfix.

## Commit Message

Gunakan pesan singkat dan spesifik.

Contoh:

```text
Add OPD filter to berita API
Fix agenda date formatting
Update Filament resource columns
```

## Sebelum Membuat PR

Pastikan pengecekan berikut sudah dilakukan sesuai area perubahan:

```bash
# Backend, dari root project jika memakai Docker
docker compose exec backend sh -lc "cd /var/www/html/backend && find app database/migrations routes config -name '*.php' -print0 | xargs -0 -n1 php -l"

# Frontend
cd frontend
npm ci
npm run build
```

Jika ada perubahan database, sertakan migration dan jelaskan dampaknya di PR.

## Konvensi Backend

- Letakkan API publik di `backend/routes/api.php`.
- Controller API berada di `backend/app/Http/Controllers/Api`.
- Model berada di `backend/app/Models`.
- Resource admin Filament berada di `backend/app/Filament/Resources`.
- Jangan mengubah dump SQL untuk perubahan skema baru; gunakan migration.

## Konvensi Frontend

- Gunakan pola store dan utility yang sudah ada di `frontend/src/stores` dan `frontend/src/utils`.
- Hindari hardcode URL API di komponen; gunakan helper/API client yang tersedia.
- Pastikan tampilan tetap responsif sebelum PR.

## Review

Reviewer fokus pada:

- Bug atau potensi regresi.
- Keamanan data dan akses.
- Kesesuaian alur branch.
- Migration dan kompatibilitas API.
- Dampak ke frontend/admin.

PR boleh di-merge setelah review selesai dan checks utama lulus.
