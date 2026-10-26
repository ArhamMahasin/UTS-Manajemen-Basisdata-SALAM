\# SALAM — Sistem Administrasi dan Layanan Akademik Mahasiswa



Proyek UTS mata kuliah Manajemen Basis Data.



\## Teknologi

\- Docker dan Docker Compose

\- PostgreSQL 15

\- pgAdmin 4

\- DBeaver



\## Struktur Proyek



```text

UTS Basisdata/

├── docker-compose.yml

├── .env.example

├── .gitignore

└── sql/

&#x20;   ├── 00\_create\_users.sql

&#x20;   ├── 01\_schema\_mahasiswa.sql

&#x20;   └── 02\_hak\_akses.sql

```



\## Konfigurasi



1\. Salin `.env.example` menjadi `.env`.

2\. Sesuaikan nilai konfigurasi di dalam `.env`.

3\. Pastikan Docker Desktop sedang berjalan.



File `.env` berisi konfigurasi dan kredensial lokal sehingga tidak disertakan dalam repositori.



\## Menjalankan Container



Buka terminal pada direktori proyek, lalu jalankan:



```powershell

docker compose up -d

```



Memeriksa status container:



```powershell

docker compose ps

```



Menghentikan container:



```powershell

docker compose down

```



\## Akses Database



\- PostgreSQL: `localhost:22016`

\- pgAdmin: `http://localhost:44016`



Sesuaikan port jika konfigurasi pada `.env` diubah.



\## Struktur Database



Database menggunakan schema `SALAM` dengan tabel `mahasiswas`.



Tabel memiliki:

\- Primary key pada `nim`

\- Unique constraint pada `email`

\- Check constraint untuk `semester` (1–14)

\- Check constraint untuk `ipk` (0–4)



\## Hak Akses



| User | Hak akses |

|---|---|

| `backend\_dev` | CRUD tabel |

| `bi\_dev` | Membaca data |

| `data\_engineer` | CRUD dan pengelolaan objek database |



\## Skrip SQL



Jalankan skrip SQL sesuai urutan berikut:



1\. `sql/00\_create\_users.sql`

2\. `sql/01\_schema\_mahasiswa.sql`

3\. `sql/02\_hak\_akses.sql`



Jalankan skrip menggunakan akun PostgreSQL administrator. Skrip pembuatan user hanya dijalankan satu kali pada instalasi awal.



\## Catatan



Proyek ini dibuat untuk memenuhi tugas UTS Manajemen Basis Data.

