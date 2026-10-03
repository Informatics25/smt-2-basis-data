# Pertemuan 2: MySQL, Instalasi, dan DDL Dasar

## Tujuan
* Praktikan dapat menginstal MySQL pada lingkungan Windows (menggunakan XAMPP).
* Praktikan dapat memahami tipe data MySQL.
* Praktikan dapat memahami perintah dasar MySQL melalui command prompt.

## Instalasi MySQL dengan XAMPP
MySQL dapat didownload di situs resminya `http://www.mysql.com` atau diinstal bersama program paket XAMPP (`www.apachefriends.org`).

**Mengatasi Error Port pada XAMPP (Apache Tidak Running):**
Hal ini biasanya terjadi karena bentrok port HTTP (80) atau SSL (443).
1. Buka `httpd.conf` di `C:\xampp\apache\conf\`. Ubah `Listen 80` menjadi `Listen 8080`, dan `ServerName localhost:80` menjadi `ServerName localhost:8080`.
2. Buka `httpd-ssl.conf` di `C:\xampp\apache\conf\extra\`. Ubah `Listen 443` menjadi `Listen 4499`, `<VirtualHost _default_:443>` menjadi `<VirtualHost _default_:4499>`, dan `ServerName localhost:443` menjadi `ServerName localhost:4499`.
3. Restart Apache. Akses di browser via `http://localhost:8080/xampp`.

## Tipe Data MySQL
* **Numerik:** `Integer` (bilangan bulat) dan `Floating point` (bilangan desimal).
* **String (Rangkaian Karakter):** `CHAR`, `VARCHAR`, `TINYTEXT`, `TEXT`, `MEDIUMTEXT`, `LONGTEXT`. `CHAR` dan `VARCHAR` pada prinsipnya sama, bedanya hanya di alokasi jumlah memori yang dibutuhkan.
* **Tanggal & Jam:** `DATETIME`, `DATE`, `TIMESTAMP`, `TIME`, dan `YEAR`.

## Koneksi dan Perintah Dasar Command Prompt
Buka DOS Prompt (CMD) lalu ketik:
```bash
cd \xampp\mysql\bin
mysql -u root -p
```
* **Membuat/Mengganti Password:** `SET PASSWORD = PASSWORD('passwordbaru');`
* **Keluar:** Ketik `quit` atau `\q`
* **Bantuan:** Ketik `\h` atau `\?`

## Pengenalan SQL
1. **DDL (Data Definition Language):** `CREATE`, `ALTER`, `RENAME`, `DROP`
2. **DML (Data Manipulation Language):** `SELECT`, `INSERT`, `UPDATE`, `DELETE`
3. **DCL (Data Control Language):** `GRANT`, `REVOKE`

## Operasi DDL Dasar

### Database
```sql
CREATE DATABASE nama_database; -- Membuat database
SHOW DATABASES;                -- Melihat database
USE nama_database;             -- Mengaktifkan database
DROP DATABASE nama_database;   -- Menghapus database
```

### Tabel
```sql
-- Membuat tabel
CREATE TABLE mahasiswa (
    nim CHAR(10) PRIMARY KEY,
    nama VARCHAR(35),
    jenkel ENUM('P','L'),
    telepon VARCHAR(15) UNIQUE
);

DESC mahasiswa;           -- Membuka struktur tabel
DROP TABLE mahasiswa;     -- Menghapus tabel
```

### Modifikasi Tabel (ALTER)
```sql
-- Menambah field
ALTER TABLE nama_tabel ADD nama_field type_data(length);

-- Mengganti nama field
ALTER TABLE nama_tabel CHANGE field_lama field_baru type_data(length);

-- Merubah tipe data
ALTER TABLE nama_tabel MODIFY field type_data(length);

-- Menghapus field
ALTER TABLE nama_tabel DROP nama_field;

-- Mengganti nama tabel
RENAME TABLE nama_tabel_lama TO nama_tabel_baru;
-- atau
ALTER TABLE nama_tabel_lama RENAME nama_tabel_baru;
```
