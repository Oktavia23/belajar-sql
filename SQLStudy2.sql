
--DISTINCT ==> Dengan menggunakan DISTINCT, Anda dapat mengecualikan baris yang memiliki data yang sama dari hasil pencarian. Anda dapat menentukan nama kolom untuk mendapatkan baris unik dan mengecualikan duplikatnya. Untuk melakukan hal ini, gunakan syntax berikut: DISTINCT( column_name )
-- Jalankan code untuk menampilkan kolom character_name dengan duplikasi
SELECT  character_name
FROM purchases;
-- dapatkan baris dari kolom character_name dengan duplikat dihilangkan
SELECT DISTINCT (character_name)
FROM purchases;
-- dapatkan baris dari kolom name tanpa duplikat
SELECT DISTINCT (name)
FROM purchases;

-- Agar bisa mendapatkan harga termasuk pajak, kita akan mengkalikan kolom price dengan 1.09 (untuk tarif pajak sebesar 9%). Dalam kueri SQL, untuk mendapatkan nilai hasil penghitungan, operator aritmetika dapat digunakan setelah kata kunci SELECT .
/*
ambil data harga setelah pajak penjualan dari kolom price
dengan melanjutkan statement dibawah
*/

SELECT name, price, price * 1.09
FROM purchases;

--SUM
-- dapatkan total jumlah dari kolom price
SELECT SUM(price)
FROM purchases;
/*
dapatkan jumlah total dari kolom price dimana
nilai character_name adalah "Ninja Ken"
*/

SELECT SUM(price)
FROM purchases
WHERE character_name = "Ninja Ken"
;

--AVG
-- dapatkan nilai rata-rata dari kolom price
SELECT AVG(price)
FROM purchases;
/*
dapatkan nilai rata-rata dari kolom price dimana
nilai character_name adalah "Ninja Ken" 
*/

SELECT AVG(price)
FROM purchases
WHERE character_name = "Ninja Ken"
;

--COUNT ==> Function COUNT digunakan untuk menghitung jumlah total baris pada kolom yang ditargetkan. Ini dapat dilakukan dengan menggunakan syntax COUNT(column_name) sebagaimana ditampilkan pada contoh di bawah.
-- dapatkan jumlah baris dikolom name dari table purchases 
SELECT COUNT(name)
FROM purchases;
-- dapatkan jumlah baris di tabel purchases 
SELECT COUNT(*)
FROM purchases;
-- dapatkan jumlah total baris dimana nilai character_name adalah "Ninja Ken"
SELECT COUNT(*)
FROM purchases
WHERE character_name = "Ninja Ken"
;

--MAX, MIN 
-- dapatkan harga tertinggi di kolom price
SELECT MAX(price)
FROM purchases;
-- dapatkan harga terendah dikolom price
SELECT MIN(price)
FROM purchases;
/*
untuk baris dimana nilai character_name adalah "Ninja Ken"
dapatkan harga tertinggi dari semua nilai dikolom price
*/

SELECT MAX(price)
FROM purchases
WHERE character_name = "Ninja Ken"
;

--Mengelompokkan Data
--GROUP BY ==> Dengan GROUP BY, Anda dapat mengelompokkan baris. Misalnya, menggunakan syntax GROUP BY column_name, sebagaimana ditampilkan di bawah ini, baris dengan nilai yang sama akan dikelompokkan untuk kolom yang Anda tentukan.
-- dapatkan jumlah total uang yang dikeluarkan untuk setiap grup purchased_at 
SELECT SUM(price), purchased_at
FROM purchases
GROUP BY purchased_at;
-- dapatkan jumlah baris untuk setiap grup purchased_at 
SELECT COUNT(price), purchased_at
FROM purchases
GROUP BY purchased_at;
-- dapatkan total harga purchases berdasarkan purchased_at dan character_name
SELECT SUM(price),purchased_at, character_name
FROM purchases
GROUP BY purchased_at, character_name
;
/*
dapatkan total berapa kali purchases terjadi berdasarkan
purchased_at and character_name
*/

SELECT COUNT(*), purchased_at, character_name
FROM purchases
GROUP BY purchased_at, character_name
;

/*
tambahkan aturan di klausa WHERE untuk mengelompokkan
baris, dimana character_name adalah "Ninja Ken"
*/

SELECT SUM(price), purchased_at
FROM purchases
WHERE character_name = "Ninja Ken"
GROUP BY purchased_at
;
/*
Tambahkan klausa WHERE untuk mendapatkan baris dengan category "makanan"
setelah itu, kelompokkan hasilnya berdasarkan kolom
purchased_at dan character_name 
*/

SELECT SUM(price), purchased_at, character_name
FROM purchases
WHERE category = "makanan" 
GROUP BY purchased_at, character_name
;

/*HAVING ==> Jika Anda ingin mempersempit penyaringan hasil data yang dikelompokkan menggunakan GROUP BY, Anda dapat menggunakan HAVING. Sebagaimana ditampilkan pada contoh dibawah, kita bisa mendapatkan grup dengan kondisi tertentu dengan menggunakan syntax: GROUP BY column_name HAVING kondisi.
HAVING & WHERE ==> Untuk mempersempit data setelah pengelompokan, gunakanlah HAVING, bukan WHERE, karena SQL memiliki urutan specific dalam menjalankan kueri-nya. Sebagaimana ditampilkan pada gambar di bawah, WHERE dijalankan pertama, lalu GROUP BY, lalu function, dan HAVING dijalankan terakhir.
 Bergantung pada urutannya, WHERE dan HAVING mencari target yang berbeda. WHERE mencari seluruh tabel sebelum pengelompokan, sementara HAVING mencari grup yang dibuat dengan GROUP BY.*/
/*
dapatkan total harga, lalu kelompokkan hasilnya berdasarkan tanggal,
hanya untuk grup yang memiliki total harga lebih dari 20
*/

SELECT SUM(price), purchased_at
FROM purchases
GROUP BY purchased_at
HAVING SUM(price) > 20
;
-- dapatkan total berdasarkan tanggal dan karakter dimana totalnya lebih dari 30
SELECT SUM(price), purchased_at, character_name
FROM purchases
GROUP BY purchased_at, character_name
HAVING SUM(price) > 30
;

--LATIHAN
/*
grup berdasarkan categori, setelah itu dapatkan total jumlah kolom price
dan kolom category untuk setiap grup
*/

SELECT SUM(price), category
FROM purchases
GROUP BY category
;
/*
buatlah sebuah grup untuk setiap karakter,
dan dapatkan total jumlah dari kolom price dan character_name 
tetapi, aggregatkan hasil hanya untuk kolom category dengan nilai "lainnya"
*/

SELECT SUM(price), character_name
FROM purchases

WHERE  category = "lainnya"
GROUP BY character_name
;



