
/*Struktur Database => Database mengelola data didalam tabel seperti gambar dikiri. Secara vertikal, data disusun dalam kolom dan secara horizontal, data disusun dalam baris. Didalam database, kita bisa membuat banyak tabel.
SELECT => Dalam SQL, kita menggunakan klausa SELECT untuk mendapatkan data dari database. SELECT digunakan untuk memilih dan mengakses kolom data yang ingin anda olah.*/
-- Akses kolom "name" dari tabel "purchases" 
SELECT name
FROM purchases;

/*Mengambil Data dari Beberapa Kolom*/
-- Akses kolom "name" dan "price" dari tabel "purchases" 
SELECT name, price
FROM purchases;
-- Akses semua kolom dari tabel "purchases" 
SELECT*
FROM purchases;

/*WHERE => 
WHERE
Untuk mendapatkan baris tertentu, gunakan klausa WHERE. Sampai disini, kita sudah mempelajari cara untuk mengakses kolom di tabel tertentu untuk mendapatkan baris-barisnya. Dengan menggunakan WHERE kita dapat secara spesifik menunjukkan baris yang memiliki data tertentu.*/
/*
Dibawah "FROM purchases" tambahkan code untuk mengambil baris dengan
nilai "makanan" dikolom "category" 
*/

SELECT *
FROM purchases
WHERE category= "makanan";

--Jenis Data
/*
dibawah baris "FROM purchases" tambahkan code untuk
mendapatkan baris dengan nilai "10" dikolom "price" 
*/

SELECT *
FROM purchases
WHERE price = 10;
/*
dibawah baris "FROM purchases" tambahkan code untuk
mendapatkan baris dengan nilai "2018-10-10" dikolom "purchased_at" 
*/

SELECT *
FROM purchases
WHERE purchased_at = "2018-10-10";

--Operator Perbandingan
/*
dibawah "FROM purchases" tambahkan code untuk
mengambil baris dengan nilai "10" atau lebih dari kolom "price" 
*/

SELECT *
FROM purchases
WHERE price >= 10;
/*
dibawah "FROM purchases" tambahkan code untuk mengambil baris dengan
nilai tanggal "2018-11-01" dan sebelumnya dari kolom "purchased_at"
*/

SELECT *
FROM purchases
WHERE purchased_at <= "2018-11-01";

--Operator LIKE dan penggunaan wildcard => Untuk menggunakan operator LIKE, Anda harus belajar tentang wildcard. Dalam dunia pemrograman, "wildcard" adalah simbol untuk menggantikan satu / beberapa karakter dalam sebuah string. Simbol wildcard (%) dapat digunakan dengan operator LIKE. Berikut ini adalah contoh menggunakan wildcard untuk menampilkan semua baris yang berisi "puding" di kolom "name".
/*
dibawah "FROM purchases" tambahkan code untuk mengambil
baris dimana nilai "name" mengandung kata "puding"
*/

SELECT *
FROM purchases
WHERE name LIKE "%puding%";
/*
dibawah "FROM purchases" tambahkan code untuk
mengambil baris dimana nilai "name" dimulai dengan kata "puding"
*/

SELECT *
FROM purchases
WHERE name LIKE "puding%";
/*
dibawah "FROM purchases" tambahkan code untuk
mengambil baris dimana nilai "name" diakhiri dengan kata "puding"
*/

SELECT *
FROM purchases
WHERE name LIKE "%puding";

--Operator NOT
/*
dibawah "FROM purchases" tambahkan code untuk mendapatkan semua baris dimana
kolom "character_name" bukanlah "Ninja Ken"
*/

SELECT *
FROM purchases
WHERE NOT character_name = "Ninja Ken";
/*
dibawah "FROM purchases" tambahkan code untuk mendapatkan semua baris dimana
kolom "name" tidak mengandung kata "puding"
*/

SELECT *
FROM purchases
WHERE NOT name LIKE "%puding%";

-- NULL => Untuk memilih baris yang berisi nilai NULL dikolom tertentu, gunakan IS NULL. Sebagai contoh di bawah ini, dengan kondisi misalnya "WHERE column_name IS NULL" kita bisa mencari baris dimana kolomnya bernilai NULL. Ini berguna disituasi dimana kita mau mencari kolom yang kita lewatkan tanpa sengaja.
/*
dibawah "FROM purchases" tambahkan code untuk mengambil baris
dimana kolom  "price" adalah NULL
*/

SELECT *
FROM purchases
WHERE price IS NULL;
/*
dibawah "FROM purchases" tambahkan code untuk mengambil baris
dimana kolom "price" adalah NOT NULL
*/

SELECT *
FROM purchases
WHERE price IS NOT NULL;

/*Operator AND => Dengan menggunakan AND, kita bisa menentukan beberapa kondisi atau syarat untuk klausa WHERE. Gunakan struktur "WHERE kondisi1 AND kondisi2" untuk mencari baris yang memenuhi kedua kondisi.
Operator OR => Seperti operatorAND, operator OR dapat digunakan di kueri SQL untuk memasukkan beberapa kondisi. Gunakan struktur "WHERE kondisi1 OR kondisi2" untuk mencari baris yang memenuhi salah satu kondisi (atau keduanya).*/
/*
dibawah "FROM purchases" tambahkan code untuk mengambil baris
dimana nilai kolom "category" adalah "makanan"
dan nilai kolom "character_name" adalah "Guru Domba"
*/

SELECT *
FROM purchases
WHERE category = "makanan"
AND character_name = "Guru Domba";
/*
dibawah "FROM purchases" tambahkan code untuk mengambil baris
dimana nilai kolom "category" adalah "makanan"
atau nilai kolom "character_name" adalah "Ninja Ken"
*/

SELECT *
FROM purchases
WHERE category = "makanan"
OR character_name = "Ninja Ken";

/*ORDER BY => Dalam SQL, kamu bisa mengurutkan baris menggunakan ORDER BY. Kamu juga bisa memilih kolom tertentu yang ingin kamu urutkan, seperti contoh berikut ini. Kamu juga harus menentukan bagaimana cara pengurutannya di bagian akhir kueri.
ORDER BY memerlukan method untuk mengurutkan data secara "menurun (DESC)" atau "menaik (ASC)". Urutan naik akan meletakkan nilai terkecil terlebih dahulu. Sedangkan urutan turun akan meletakkan nilai terbesar terlebih dahulu. Dalam code SQL, ASC digunakan untuk "ascending (menaik)" sedangkan DESC digunakan untuk "descending (menurun)".*/ 
/* 
dibawah "FROM purchases" tambahkan code untuk
menampilkan baris dari nilai yang terbesar dikolom "price"
*/

SELECT *
FROM purchases
ORDER BY price DESC;
/*
dibawah WHERE character_name = "Ninja Ken", tambahkan code untuk
menampilkan baris dari nilai terkecil dikolom "price"
*/

SELECT *
FROM purchases
WHERE character_name = "Ninja Ken"
ORDER BY price ASC;

--LIMIT
/*
dibawah "FROM purchases" tambahkan code untuk
menampilkan maksimum 5 baris hasil
*/

SELECT *
FROM purchases
LIMIT 5;

--LATIHAN
/*
Dibawah "FROM purchases" tambahkan code untuk mengambil baris
dengan nilai tanggal "2018-11-01" dan sebelumnya, dari kolom "purchased_at"
*/

SELECT *
FROM purchases
WHERE purchased_at <= "2018-11-01";

/*
Dibawah "FROM purchases" tambahkan code untuk baris dimana
kolom "name" mengandung string "puding"
*/

SELECT *
FROM purchases
WHERE name LIKE"%puding%";
/*
dibawah "FROM purchases" gunakan operator NOT untuk menambahkan code untuk
mengambil baris dimana nilai kolom "character_name" adalah bukan "Ninja Ken"
*/

SELECT *
FROM purchases
WHERE NOT character_name  = "Ninja Ken";
/*
dibawah "FROM purchases" tambahkan code untuk
menambahkan baris dimana kolom "price" adalah NULL
*/

SELECT *
FROM purchases
WHERE price IS NULL;
/*
setelah "FROM purchases" tambahkan code untuk mengambil baris dimana nilai
kolom "category" adalah "makanan" dan kolom "character_name" adalah "Guru Domba"
*/

SELECT *
FROM purchases
WHERE category = "makanan"
AND character_name = "Guru Domba";
/*
dibawah "FROM purchases" tambahkan code untuk mengambil maksimum 5 baris
dengan urutan terbesar dari kolom "price"
*/

SELECT *
FROM purchases
ORDER BY price DESC
LIMIT 5;






