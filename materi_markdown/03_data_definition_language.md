# Pertemuan 3: Data Definition Language (DDL) Lanjutan

## Tujuan
* Praktikan mampu memahami perintah DDL.
* Praktikan memahami constraint dan perintah dasar MySQL.

## Perintah Utama DDL
* **CREATE:** Membuat dan mengelola database atau tabel independen.
* **USE:** Menentukan database yang ingin diajak bekerja.
* **ALTER:** Membuat perubahan pada struktur tabel tanpa menghapus dan menciptakan tabel baru.
* **DROP:** Menghapus seluruh objek database dari DBMS secara keseluruhan. Hati-hati menggunakan perintah ini!

## Constraint (Batasan/Aturan pada Tabel)
1. **NOT NULL:** Kolom tidak boleh berisi nilai NULL (kosong). Kolom Primary Key otomatis tidak boleh NULL.
2. **UNIQUE:** Mendefinisikan suatu kolom bersifat unik, data satu dengan yang lain tidak boleh sama (contoh: email, telepon).
3. **PRIMARY KEY:** Membentuk key yang unik untuk mengidentifikasi record dalam suatu tabel.
4. **FOREIGN KEY:** Didefinisikan pada suatu kolom yang merujuk pada PRIMARY KEY di tabel lain. Biasa dipakai untuk menghubungkan antar 2 tabel.

## Implementasi Primary Key
Dapat dilakukan saat membuat tabel:
```sql
CREATE TABLE namatabel(
    Field1 TipeData1 NOT NULL PRIMARY KEY,
    Field2 TipeData2
);
```
Atau menggunakan perintah ALTER setelah tabel dibuat:
```sql
ALTER TABLE namatabel ADD CONSTRAINT PRIMARY KEY (namakolom);
```
**Menghapus Primary Key:**
```sql
ALTER TABLE namatabel DROP PRIMARY KEY;
-- Jika menggunakan nama constraint khusus:
ALTER TABLE namatabel DROP CONSTRAINT namaconstraint;
```

## Implementasi Foreign Key
Saat membuat tabel:
```sql
CREATE TABLE namatabel(
    Field1 TipeData1,
    Field2 TipeData2,
    FOREIGN KEY (Field2) REFERENCES namatabelinduk(namakolominduk) ON UPDATE CASCADE ON DELETE NO ACTION
);
```
Menggunakan perintah ALTER:
```sql
ALTER TABLE namatabel ADD CONSTRAINT nama_constraint FOREIGN KEY (namakolom) REFERENCES namatabelinduk(namakolominduk) ON UPDATE CASCADE ON DELETE NO ACTION;
```
**Menghapus Foreign Key:**
Gunakan `SHOW CREATE TABLE namatabel;` untuk melihat nama constraint otomatisnya terlebih dahulu.
```sql
ALTER TABLE namatabel DROP FOREIGN KEY nama_constraint;
```
