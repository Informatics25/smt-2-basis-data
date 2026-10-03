# Pertemuan 4: Data Manipulation Language (DML) Dasar

## Tujuan
* Praktikan memahami DML.
* Praktikan dapat mengimplementasikan perintah DML pada database.

## Apa itu DML?
DML adalah metode query yang digunakan apabila DDL telah dijalankan (tabel sudah ada). Fungsi DML adalah untuk memanipulasi data di dalam database.
Ada 2 jenis DML:
1. **Prosedural:** Pemakai menentukan data apa yang diinginkan dan bagaimana cara mendapatkannya.
2. **Non-prosedural:** Pemakai menentukan data apa yang diinginkan tanpa menyebutkan bagaimana cara mendapatkannya.

## Perintah Dasar DML
1. **INSERT:** Memasukkan baris data ke dalam tabel.
2. **UPDATE:** Mengubah data yang sudah ada di dalam tabel.
3. **DELETE:** Menghapus data pada tabel.
4. **SELECT:** Memunculkan/mengambil data dari tabel.

## Implementasi DML

### 1. INSERT (Mengisi Tabel)
```sql
-- Mengisi semua kolom secara berurutan
INSERT INTO nama_tabel VALUES (nilai1, nilai2, ...);

-- Mengisi kolom tertentu saja
INSERT INTO nama_tabel (kolom1, kolom3) VALUES (nilai1, nilai3);
```

### 2. UPDATE (Merubah Data)
```sql
UPDATE nama_tabel 
SET nama_kolom = nilai_baru 
WHERE kondisi;
```

### 3. DELETE (Menghapus Data)
```sql
DELETE FROM nama_tabel WHERE kondisi;
```

### 4. SELECT (Menampilkan Data)
```sql
-- Menampilkan kolom tertentu
SELECT kolom1, kolom2 FROM nama_tabel;

-- Menampilkan seluruh kolom
SELECT * FROM nama_tabel;

-- Memilih nilai yang tidak kembar/unik
SELECT DISTINCT nama_kolom FROM nama_tabel;
```

## Klausa WHERE
Digunakan untuk memberikan filter/kondisi pencarian.
* **Operator Perbandingan:** `=`, `<>` atau `!=` (Tidak sama dengan), `>`, `<`, `>=`, `<=`.
* **BETWEEN:** Di antara dua nilai.
* **LIKE:** Mencari pola tertentu pada string. Tanda `%` mewakili sembarang huruf panjang, tanda `_` mewakili tepat satu karakter.
  * *Contoh:* `WHERE nama LIKE 'A%'` (berawalan A).
* **Operator Penghubung Logika:**
  * `&&` atau `AND` (True jika keduanya True).
  * `||` atau `OR` (True jika salah satu True).
  * `!` atau `NOT` (Membalikkan nilai logika).

```sql
SELECT * FROM mahasiswa WHERE tempatLahir = 'Surabaya' AND jenKel = 'P';
```
