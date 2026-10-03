-- KUMPULAN SKEMA LATIHAN BASIS DATA LENGKAP (W2 - W6)
-- Mata Kuliah Basis Data Semester 2

CREATE DATABASE IF NOT EXISTS basis_data_smt2;
USE basis_data_smt2;

-- 1. PRAKTIKUM W2 & W3: JURUSAN, DOSEN, MAHASISWA

-- Tabel Jurusan
CREATE TABLE jurusan (
    kodeJur VARCHAR(5) PRIMARY KEY,
    nmJur VARCHAR(35) NOT NULL,
    email VARCHAR(35),
    telp VARCHAR(15)
);

-- Tabel Dosen
CREATE TABLE dosen (
    nip VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(35) NOT NULL,
    email VARCHAR(35),
    telpon VARCHAR(15)
);

-- Tabel Mahasiswa (Sesuai modifikasi W4)
CREATE TABLE mahasiswa (
    nim INT(10) PRIMARY KEY,
    nama VARCHAR(35) NOT NULL,
    jenKel ENUM('P','L') NOT NULL,
    tempatLahir VARCHAR(30) NOT NULL,
    tglLahir DATE,
    telepon INT(15),
    email VARCHAR(30),
    alamat VARCHAR(30) NOT NULL,
    kodeJur VARCHAR(5),
    nip VARCHAR(15),
    FOREIGN KEY (kodeJur) REFERENCES jurusan(kodeJur) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (nip) REFERENCES dosen(nip) ON UPDATE CASCADE ON DELETE NO ACTION
);

-- Insert Data Latihan Mahasiswa (Berdasarkan W4)
INSERT INTO mahasiswa (nim, nama, jenKel, tempatLahir, telepon, email, alamat) VALUES
(15001, 'Andi', 'L', 'Malang', 123456, 'and@y.com', 'Jl.Kincir'),
(15002, 'Yunita', 'P', 'Madura', 654321, 'yun@y.com', 'Jl.Kopi'),
(15003, 'Rindra', 'L', 'Malang', 234561, 'rin@y.com', 'Jl. Kincir'),
(15004, 'Emi', 'P', 'Surabaya', 345612, 'em@y.com', 'Jl. Tugu'),
(15005, 'Eka', 'L', 'Surabaya', 456123, 'ek@y.com', 'Jl. Kopi');


-- 2. PRAKTIKUM W2: PEKERJA (GANJIL) & PEGAWAI MEDIS (GENAP)

-- Tabel Pekerja (Hasil akhir dari latihan tabel 'karyawan' W2)
CREATE TABLE pekerja (
    Id_pekerja CHAR(5) PRIMARY KEY,
    namaLengkap VARCHAR(35) NOT NULL UNIQUE,
    tglMasuk DATE NOT NULL,
    golongan ENUM('junior','senior') NOT NULL,
    agama ENUM('Islam','Kristen','Katolik','Hindu','Buddha','Konghucu')
);

-- Tabel Proyek
CREATE TABLE proyek (
    kdProyek CHAR(5) PRIMARY KEY,
    namaProyek VARCHAR(35) NOT NULL,
    Id_pekerja CHAR(5),
    FOREIGN KEY (Id_pekerja) REFERENCES pekerja(Id_pekerja) ON UPDATE CASCADE
);

-- Tabel Pegawai Medis (Hasil akhir dari latihan tabel 'dokter' W2)
CREATE TABLE pegawaiMedis (
    kdDokter CHAR(5) PRIMARY KEY,
    namaLengkap VARCHAR(35) NOT NULL UNIQUE,
    jenisKel ENUM('Perempuan','Laki-laki') NOT NULL,
    lokPraktek VARCHAR(35) DEFAULT 'Surabaya',
    spesialisasi VARCHAR(30)
);

-- Tabel Ruang
CREATE TABLE ruang (
    kdRuang CHAR(5) PRIMARY KEY,
    namaRuang VARCHAR(35) NOT NULL,
    kdDokter CHAR(5),
    FOREIGN KEY (kdDokter) REFERENCES pegawaiMedis(kdDokter) ON UPDATE CASCADE
);


-- 3. PRAKTIKUM W6: DEPARTEMEN & KARYAWAN (TUGAS DDL/DML)

-- Tabel Departemen (Induk)
CREATE TABLE departemen (
    kode_dept VARCHAR(10) PRIMARY KEY,
    nama_dept VARCHAR(30),
    lokasiDept VARCHAR(30),
    telpDept VARCHAR(15)
);

-- Tabel Karyawan (Anak)
CREATE TABLE karyawan (
    ID_karyawan INT(11) PRIMARY KEY,
    namaDepan VARCHAR(25),
    namaBelakang VARCHAR(25),
    kode_dept VARCHAR(10),
    Alamat VARCHAR(30),
    Gaji INT(15),
    FOREIGN KEY (kode_dept) REFERENCES departemen(kode_dept) ON UPDATE CASCADE ON DELETE NO ACTION
);

-- Insert Data Latihan Departemen & Karyawan
INSERT INTO departemen (kode_dept, nama_dept) VALUES 
('DepKEU', 'Dept Keuangan'),
('DepSDM', 'Departemen SDM');

INSERT INTO karyawan (ID_karyawan, namaDepan, kode_dept, Alamat, Gaji) VALUES
(1, 'Andi', 'DepKEU', 'Surabaya', 2500000),
(2, 'Yoni', 'DepKEU', 'Sidoarjo', 1800000),
(3, 'Yana', 'DepSDM', 'Surabaya', 3000000),
(4, 'Ani', 'DepSDM', 'Gresik', 1500000);


-- 4. PRAKTIKUM W6 (DML 3): STUDENT, COURSE, SCORE, SIBLING

-- Tabel Student
CREATE TABLE student (
    idStudent CHAR(3) PRIMARY KEY,
    StudentName VARCHAR(20),
    alamat VARCHAR(10),
    email VARCHAR(20)
);

-- Tabel Course
CREATE TABLE course (
    CourseId CHAR(3) PRIMARY KEY,
    CourseName VARCHAR(20)
);

-- Tabel Score
CREATE TABLE score (
    idStudent CHAR(3),
    CourseId CHAR(3),
    Score INT(2),
    result CHAR(1),
    FOREIGN KEY (idStudent) REFERENCES student(idStudent) ON DELETE CASCADE,
    FOREIGN KEY (CourseId) REFERENCES course(CourseId) ON DELETE CASCADE
);

-- Tabel Sibling
CREATE TABLE sibling (
    idStudent CHAR(3),
    siblingName VARCHAR(20),
    relation VARCHAR(20),
    FOREIGN KEY (idStudent) REFERENCES student(idStudent) ON DELETE CASCADE
);

-- Insert Data Latihan Student, Course, Score, Sibling
INSERT INTO student VALUES 
('11', 'John', 'Surabaya', 'john@gmail.com'),
('12', 'Mike', 'Malang', 'mike@gmail.com'),
('13', 'Chan', 'Surabaya', 'chan@gmail.com');

INSERT INTO course VALUES 
('BD', 'Basis Data'),
('GC', 'Graphica Computer');

INSERT INTO score VALUES 
('11', 'BD', 80, 'A'),
('11', 'GC', 70, 'B'),
('12', 'BD', 70, 'B'),
('12', 'GC', 60, 'C');

INSERT INTO sibling VALUES
('11', 'Ann', 'Sister'),
('11', 'Ema', 'Sister'),
('11', 'Jimm', 'Brother'),
('13', 'Mick', 'Brother'),
('12', 'Joerge', 'Brother'),
('12', 'Joe', 'Sister');

-- END OF SCRIPT
