# Pertemuan 6: DML Lanjutan (Select & Fungsi Agregat)

## Tujuan
* Memahami penggunaan Alias.
* Memahami GROUP BY dan fungsi agregat.
* Memahami pengurutan dengan ORDER BY.
* Menggunakan klausa IN/NOT IN dan HAVING.

## 1. ALIAS (AS)
Gunakan syntax `AS` untuk memberikan nama sementara (alias) pada kolom saat ditampilkan. Berguna saat menampilkan hasil perhitungan matematis atau fungsi.
```sql
SELECT idStudent, CourseId, Score, Score * 0.05 AS grading FROM score;
```

## 2. GROUP BY
Digunakan untuk mengelompokkan baris berdasarkan nilai tertentu. Biasanya dikombinasikan dengan fungsi agregat seperti `COUNT()`, `SUM()`, `AVG()`.
```sql
SELECT alamat, COUNT(alamat) FROM student GROUP BY alamat;
-- Output: Menampilkan jumlah mahasiswa dari masing-masing kota/alamat.
```

## 3. ORDER BY
Untuk mengurutkan hasil data berdasarkan kolom tertentu.
* `ASC` : Ascending (Urut naik, dari A-Z atau Kecil-Besar).
* `DESC`: Descending (Urut turun, dari Z-A atau Besar-Kecil).
```sql
SELECT * FROM student ORDER BY alamat ASC;
SELECT * FROM student ORDER BY alamat DESC;
```

## 4. IN dan NOT IN
Digunakan untuk mencocokkan nilai berdasarkan daftar atau kumpulan nilai yang spesifik di dalam klausa `WHERE`.
```sql
-- Menampilkan data yang alamatnya bukan dari Surabaya
SELECT * FROM student WHERE alamat NOT IN ('Surabaya');

-- Menampilkan data yang alamatnya berasal dari Surabaya
SELECT * FROM student WHERE alamat IN ('Surabaya');
```

## 5. HAVING
Karena `WHERE` tidak bisa digunakan untuk menyaring fungsi agregat (seperti `COUNT()`), maka kita menggunakan `HAVING`.
```sql
SELECT student.idStudent, StudentName, COUNT(sibling.idStudent) AS totalSibling
FROM student, sibling
WHERE student.idStudent = sibling.idStudent
GROUP BY student.idStudent
HAVING COUNT(sibling.idStudent) > 1;
-- Output: Menampilkan student yang memiliki lebih dari 1 saudara (sibling).
```
