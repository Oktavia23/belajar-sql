/*Menambah, Memperbarui dan Menghapus Data*/
--INSERT
-- Tambahkan data ke tabel students
INSERT INTO students( name, course)
VALUES( "Kate", "Java");
-- Jangan menghapus kueri dibawah
select * from students;

--UPDATE => digunakan untuk memperbarui data
-- Di dalam tabel student, perbarui kolom name ke Jordan dan kolom course ke HTML untuk data dengan id 6
UPDATE students
SET name = "Jordan", course = "HTML"
WHERE id = 6;


-- Jangan hapus kueri di bawah
SELECT * FROM students WHERE id=6;

--DELETE
-- Hapus data yang ber-id 7 di tabel student
DELETE FROM students
WHERE id = 7;
-- Jangan hapus kueri dibawah
SELECT * FROM students;

--MEMPRAKTIKKAN
-- Tambahkan data baru ke tabel students, dimana nilai name adalah Katy dan nilai course-nya adalah HTML
INSERT INTO students ( name, course)
VALUES( "Katy", "HTML");
-- Di dalam tabel students, perbarui kolom name menjadi Juliet dan kolom course-nya menjadi Ruby, untuk data yang ber id 6
UPDATE students
SET name = "Juliet", course = "Ruby"
WHERE id = 6;
-- Di dalam tabel students, hapus data yang ber id 2
DELETE FROM students
WHERE id = 2;
-- Jangan hapus kueri di bawah
SELECT * FROM students;






















