

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

├── .env.example

├── .gitignore

├── README.md

├── docker-compose.yml

└── sql/

&#x20;   ├── 00\_create\_users.sql

&#x20;   ├── 01\_schema\_mahasiswa.sql

&#x20;   └── 02\_hak\_akses.sql

```



\## Persyaratan



Pastikan perangkat sudah memiliki:



\- Docker Desktop

\- Git

\- DBeaver (untuk mengakses database dari luar container)



\## Konfigurasi Lingkungan



1\. Salin file `.env.example` menjadi `.env`.

2\. Buka file `.env`.

3\. Sesuaikan nilai konfigurasi jika diperlukan.

4\. Pastikan Docker Desktop sedang berjalan.



File `.env` berisi konfigurasi dan kredensial lokal. File tersebut tidak disertakan dalam repositori GitHub.



\## Menjalankan Container



Buka PowerShell di direktori proyek, kemudian jalankan:



```powershell

docker compose up -d

```



Periksa status container:



```powershell

docker compose ps

```



Untuk melihat log container:



```powershell

docker compose logs

```



Untuk menghentikan container:



```powershell

docker compose down

```



\## Akses Layanan



\### PostgreSQL



\- Host: `localhost`

\- Port: `22016`

\- Database: `postgres`

\- Username: `postgres`



Password mengikuti konfigurasi pada file `.env`.



\### pgAdmin 4



Buka browser dan akses:



`http://localhost:44016`



Login menggunakan email dan password yang dikonfigurasi di file `.env`.



Untuk menghubungkan pgAdmin ke PostgreSQL yang berjalan dalam Compose, gunakan:



\- Host: `postgres`

\- Port: `5432`

\- Maintenance database: `postgres`

\- Username: `postgres`

\- Password: sesuai file `.env`



\### DBeaver



Buat koneksi PostgreSQL dengan konfigurasi:



\- Host: `localhost`

\- Port: `22016`

\- Database: `postgres`

\- Username: `postgres`

\- Password: sesuai file `.env`



\## Struktur Database



Proyek ini menggunakan schema `SALAM` dengan tabel `mahasiswas`.



Kolom tabel:



| Kolom | Tipe Data | Ketentuan |

|---|---|---|

| `nim` | `VARCHAR(10)` | Primary key |

| `nama` | `VARCHAR(100)` | Tidak boleh NULL |

| `email` | `VARCHAR(100)` | Tidak boleh NULL dan harus unik |

| `semester` | `INT` | Nilai antara 1 sampai 14 |

| `ipk` | `NUMERIC(3,2)` | Nilai antara 0 sampai 4 |



\### Constraint



\- \*\*Primary key:\*\* memastikan setiap mahasiswa memiliki NIM yang unik.

\- \*\*Unique constraint:\*\* mencegah penggunaan email yang sama.

\- \*\*Check constraint semester:\*\* membatasi semester pada rentang 1–14.

\- \*\*Check constraint IPK:\*\* membatasi IPK pada rentang 0–4.



\## Hak Akses Pengguna Database



| Pengguna | Hak Akses |

|---|---|

| `backend\_dev` | Membaca, menambah, mengubah, dan menghapus data (CRUD) |

| `bi\_dev` | Hanya membaca data |

| `data\_engineer` | CRUD data serta pengelolaan objek database sesuai kepemilikan dan hak akses |



\## Urutan Eksekusi Skrip SQL



Jalankan skrip menggunakan akun administrator PostgreSQL dengan urutan berikut:



1\. `sql/00\_create\_users.sql` — membuat tiga pengguna database.

2\. `sql/01\_schema\_mahasiswa.sql` — membuat schema, tabel, constraint, dan memasukkan data awal.

3\. `sql/02\_hak\_akses.sql` — memberikan hak akses kepada setiap pengguna.



Skrip pembuatan pengguna dijalankan satu kali pada instalasi awal. Jika pengguna sudah ada, jangan menjalankan ulang skrip tersebut tanpa menyesuaikannya.



\## Pengujian



Pengujian dilakukan untuk memastikan:



\- Data mahasiswa dapat ditampilkan.

\- Primary key menolak NIM duplikat.

\- Unique constraint menolak email duplikat.

\- Check constraint menolak semester di luar rentang 1–14.

\- Check constraint menolak IPK di luar rentang 0–4.

\- `backend\_dev` dapat melakukan operasi CRUD.

\- `bi\_dev` hanya dapat membaca data.

\- `data\_engineer` dapat melakukan CRUD serta mengelola objek database sesuai hak aksesnya.



\## Repositori



Proyek ini dibuat untuk memenuhi tugas UTS mata kuliah Manajemen Basis Data.



Nama proyek: \*\*SALAM — Sistem Administrasi dan Layanan Akademik Mahasiswa\*\*



