# Model Entity Relationship (ERD)

## Tujuan
* Memahami pengertian entitas dan relationship.
* Mengenal bentuk dasar diagram ER.
* Menggunakan aplikasi (seperti Visio) untuk membuat ER Diagram.

## Pengertian ER Model
* Diperkenalkan oleh Chen (1976).
* Berdasarkan anggapan bahwa dunia nyata terdiri dari koleksi objek-objek dasar yang dinamakan **Entitas (Entity)** serta **Hubungan (Relationship)** antara entitas tersebut.
* Sebuah teknik pemodelan data yang merepresentasikan gambar entitas dan relasi antar entitas di dalam sistem informasi.
* Tidak bergantung pada DBMS dan platform perangkat keras apa pun.
* Komponen utama: Entitas, Relasi, dan dideskripsikan lebih detail dengan sejumlah Atribut (Properti).

## 1. Komponen Entitas (Entity)
Objek yang dapat dibedakan dalam dunia nyata (orang, tempat, objek, event, konsep).
* **Fisik:** Rumah, kendaraan, peralatan.
* **Konsep:** Pekerjaan, perusahaan, rencana.
* **Tipe Entitas:** Kategori/kelas untuk instan sejenis (biasanya menjadi **Tabel**).
* **Instan Entitas:** Anggota individu suatu entitas (biasanya direpresentasikan sebagai **Record/Baris** dalam tabel).

## 2. Komponen Relasi (Relationship)
Hubungan yang terjadi antara satu atau lebih entitas. Instan relasi direpresentasikan dengan nilai atribut (key) yang sama dalam tabel.
* **Derajat Relasi:**
  * *Unary:* Relasi yang menghubungkan satu entitas.
  * *Binary:* Relasi yang menghubungkan dua entitas.
  * *Ternary:* Relasi yang menghubungkan tiga/lebih entitas.

## 3. Komponen Atribut
Karakteristik dari entitas atau relasi yang menyediakan penjelasan detail (biasanya direpresentasikan sebagai **Field/Kolom** dalam tabel).

**Jenis-Jenis Atribut:**
* **Simple (Single-value):** Bernilai tunggal.
* **Multivalue:** Memiliki sekelompok nilai untuk setiap instan (contoh: Hobby).
* **Composite:** Terdiri dari beberapa atribut yang lebih kecil (contoh: Nama -> Nama Depan, Nama Belakang).
* **Derived (Turunan):** Dihasilkan dari atribut lain (contoh: Umur yang diturunkan dari Tanggal Lahir).
* **Key Attribute:** Atribut yang digunakan untuk menentukan suatu entitas secara unik (Pembeda mutlak).
  * *Super Key:* Satu/gabungan atribut unik.
  * *Candidate Key:* Super Key minimal.
  * *Primary Key:* Candidate key yang dipilih sebagai acuan utama, ringkas, dan unik.
  * *Foreign Key:* Key penghubung tabel.

## Kardinalitas Relasi (Rasio)
Menjelaskan batasan jumlah keterhubungan satu entitas dengan entitas lainnya:
1. **One-to-One (1:1):** Setiap entitas memiliki tepat satu entitas pasangan (contoh: Suami & Istri, Pegawai & Kendaraan Dinas).
2. **One-to-Many (1:N):** Satu entitas dapat memiliki beberapa pasangan, tapi entitas pasangannya hanya boleh memiliki tepat satu (contoh: Departemen & Pegawai).
3. **Many-to-Many (M:N):** Entitas di masing-masing sisi dapat memiliki banyak pasangan di sisi yang lain (contoh: Pegawai & Proyek).

## Notasi Dasar ERD
* **Persegi Panjang:** Entity (Entitas)
* **Belah Ketupat:** Relationship (Relasi)
* **Oval:** Attribute
* **Oval Ganda:** Multivalue Attribute
* **Oval Garis Putus-putus:** Derived Attribute
* **Persegi Panjang Garis Ganda:** Identifying Owner (Weak Entity)
* **Belah Ketupat Garis Ganda:** Identifying Relationship
