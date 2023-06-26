
/*Subkueri ==> Dalam SQL, Anda dapat menulis statement dalam statement, statement ini dinamakan subkueri. Hal ini memungkinkan Anda menggabungkan beberapa statement SQL menjadi 1 sehingga Anda bisa mendapatkan data yang lebih kompleks. Contoh di bawah ini menunjukkan cara mendapatkan "nama pemain dengan skor yang lebih tinggi dari Will".*/
SELECT name
FROM players
WHERE goals > (
  -- Ketik statement SQL untuk mendapatkan skor milik Will dibaris bawah
  SELECT goals
  FROM players
  WHERE name = "Will"
)
;
SELECT name,goals
FROM players
WHERE goals > (
  SELECT avg(goals)
  FROM players
)
;

--AS
-- Gunakan AS untuk menamai kolom "180 cm atau lebih"
SELECT name as "180 cm atau lebih"
FROM players
where height >= 180
;
-- Gunakan AS untuk menamai kolom "total skor tim"
SELECT sum(goals) AS "total skor tim" 
FROM players
;

--Cara Penggabungan Tabel ==> Di SQL, foreign key dan primary key digunakan untuk menyambungkan tabel. Dengan menentukan primary key di tabel lain dengan foreign key, Anda dapat menyambungkan tabel.
/*Dapatkan total  goals dari kolom country_id dengan menggunakan GROUP BY*/

SELECT sum(goals), country_id
FROM players
group by country_id;

/*JOIN ==> JOIN digunakan untuk menggabungkan beberapa tabel menjadi satu. Kondisi untuk penggabungan ditentukan dengan ON. Setelahnya, Anda bisa mendapatkan data dari tabel hasil gabungan selayaknya dari satu tabel. Di bawah ini adalah contoh cara menggabungkan dua tabel, tabel_a dan tabel_b.
Kondisi Penggabungan ==> Untuk menulis kondisi penggabungan, gunakan syntax: ON table_a.column_name = table_b.column_name.
Dalam contoh di bawah bagian kanan, country_id tabel players dan id tabel countries digunakan untuk penggabungan. Seperti yang ditampilkan contoh dibawah ini, jika statement SQL berisi klausa JOIN, JOIN akan dijalankan terlebih dahulu. Berikutnya, SELECT akan dijalankan di tabel gabungan.*/
SELECT *
FROM players
-- Tambahkan nama ke tabel gabungan
JOIN countries
-- Tambahkan kondisi join setelah ON
ON players.country_id = countries.id;
/*Menggunakan JOIN, gabungkan tabel countries dengan tabel pemain, lalu dapatkan berikut ini:
  ① kolom name dari tabel players
  ② kolom name dari tabel countries
*/
SELECT players.name, countries.name
FROM players
join countries
on players.country_id = countries.id
;
/* Menggunakan JOIN, gabungkan tabel countries dengan tabel players, lalu dapatkan berikut ini:
   ① kolom name dari tabel countries
   ② jumlah dari kolom goals
Selain itu, gunakan GROUP BY untuk membuat grup menggunakan 
countries.name
*/
SELECT countries.name, sum(goals) 
FROM players
join countries
on players.country_id = countries.id
group by countries.name
;

--LEFT JOIN
/* Menggunakan LEFT JOIN, gabungkan tabel teams dengan tabel players, lalu dapatkan baris tabel.
*/
SELECT *
FROM players
left join teams
on players.previous_team_id = teams.id;
/* Menggunakan LEFT JOIN, gabungkan tabel 
teams
 dengan tabel players, lalu dapatkan berikut ini:
   ① kolom name dari tabel players
   ② kolom name dari tabel teams
Selain itu, tandai kolom sebagai berikut:
   • Untuk ①, gunakan nama pemain
   • Untuk ②, gunakan tim (tahun lalu)
*/
SELECT players.name as "nama pemain", teams.name as "tim (tahun lalu)"
FROM players
left join teams
on players.previous_team_id = teams.id
;
/*JOIN dengan Beberapa Tabel ==> JOIN adalah statement SQL tunggal yang dapat digunakan lebih dari sekali. Perhatikan bahwa, meskipun Anda menggunakan JOIN lebih dari satu kali, Anda hanya perlu menulis FROM satu kali.*/
/*Tambahkan tabel berikut ke tabel players:
   ① tabel countries
   ② tabel teams
Tetapi, untuk ① gunakan JOIN dan untuk ② gunakan LEFT JOIN*/
SELECT *
FROM players
join countries
on players.country_id = countries.id
left join teams
on players.previous_team_id = teams.id;

--LATIHAN
/* Gunakan subkueri untuk mendapatkan nilai kolom height yang lebih tinggi dari tinggi rata-rata dan dapatkan berikut ini:
   ① nama pemain
   ② tinggi pemain
Tetapi, tandai kolom yang dihasilkan sebagai berikut:
   • Untuk ①, gunakan nama pemain
   • Untuk ②, gunakan tinggi pemain
*/
SELECT name as "nama pemain", height as "tinggi pemain"
FROM players
where height > (
 select avg(height)
 from players);

/*Menggunakan JOIN, dapatkan baris yang memenuhi kondisi berikut:
   ① Dari negara Jepang
   ② Setidaknya memiliki tinggi 180 cm
*/
SELECT *
FROM players
join countries
on players.country_id = countries.id
where countries.name = "Jepang"
and height >=180;

/*Menggunakan JOIN, dapatkan berikut ini:
   ① nama negara
   ② skor rata-rata untuk setiap negara
Selain itu, tandai kolom yang dihasilkan sebagai berikut:
   • Untuk ①, gunakan nama negara
  • Untuk ②, gunakan skor rata-rata
*/
SELECT countries.name as "nama negara", avg(goals) as "skor rata-rata"
FROM players
join countries
on players.country_id = countries.id
group by countries.name
;





