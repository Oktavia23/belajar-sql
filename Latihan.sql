
/*tabel items             tabel sales_records                 tabel users
kolom    | tipe data  |    | kolom          | tipe data |       | kolom   | tipe data |
id       | angka      |    | id             | angka     |       | id      | angka     |
name     | teks       |    | item_id        | angka     |       | name    | teks      |
gender   | angka      |    | user_id        | angka     |       | gender  | angka     |
price    | angka      |    | purchased_at   | tanggal   |       | age     | angka     |*/
/*cost   | angka      |*/   

--PENGGUNA
-- dapatkan nilai rata-rata umur semua pengguna
SELECT AVG(age)
FROM USERS;

-- dapatkan semua pengguna pria yang berumur dibawah 20 tahun
SELECT *
FROM users
WHERE age < 20 AND gender = 0;

/* 
dapatkan jumlah total usia unik pengguna dan
kelompokan pengguna tersebut berdasarkan usia
*/
select age, count(*)
from users
group by age;

--PRODUK (1)
-- dapatkan setiap nama barang unik (tanpa duplikat)
SELECT DISTINCT (name) 
FROM items;

/*
dapatkan nama dan harga setiap produk dan
tampilkan secara mengecil(urutkan dari yang terbesar ke yang terbesar) berdasarkan harga
*/
select name, price
from items
order by price desc
;

-- dapatkan semua baris dengan nilai string "kaos"
SELECT *
FROM items
WHERE name LIKE '%kaos%';

--PRODUK (2) 
-- dapatkan nama, harga dan laba semua produk
SELECT name, price, price - cost
FROM items
;

-- dapatkan laba rata-rata dari semua produk
SELECT AVG(price-cost)
FROM items
;

-- dapatkan nama dan laba dari 5 barang dengan laba tertinggi
SELECT name, price-cost
FROM items
ORDER BY price-cost DESC 
LIMIT 5
;

--PRODUK(3)
-- dapatkan semua produk yang harganya lebih tinggi dari harga "hoodie abu-abu"
SELECT name, price
FROM items
WHERE price > (
  SELECT price
  FROM items
  WHERE name = "hoodie abu-abu"
);

-- dapatkan semua produk yang labanya lebih tinggi dari laba "hoodie abu-abu"
SELECT name, price-cost
FROM items
WHERE price <= 70 AND price-cost > (
  SELECT price-cost
  FROM items 
  WHERE name ="hoodie abu-abu"
);

--RIWAYAT PENJUALAN
-- dapatkan jumlah berapa kali setiap jenis item terjual berdasarkan id item
SELECT item_id, count(*)
FROM sales_records
GROUP BY item_id
;

/*
dapatkan id dan jumlah penjualan per unitnya dari 5 barang paling populer.
Susun hasilnya secara menurun
*/
SELECT item_id, count(*)
FROM sales_records
GROUP BY item_id
ORDER BY count(*) DESC
LIMIT 5
;

--PENJUALAN DAN LABA
-- dapatkan nama dan jumlah penjualan unit untuk 5 barang dengan penjualan tertinggi
SELECT items.id, items.name, count(*) 
FROM sales_records
JOIN items
ON  sales_records.item_id = items.id
GROUP BY items.id, items.name
ORDER BY COUNT(*) DESC
LIMIT 5
;

-- dapatkan total penjualan dan total laba untuk seluruh site
SELECT SUM(items.price) AS "total penjualan", SUM(items.price-items.cost) AS "total laba"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
;

--ANALISIS HARIAN
-- dapatkan berapa kali penjualan terjadi untuk setiap harinya
SELECT purchased_at, count(*) AS "penjualan"
FROM sales_records
GROUP BY purchased_at 
order by purchased_at asc
;
-- dapatkan total harga penjualan dan kelompokan berdasarkan tanggal pembelianya
SELECT sales_records.purchased_at, sum(items.price) as "total penjualan"
From sales_records
join items
on sales_records.item_id = items.id
group by purchased_at
order by purchased_at asc
;
--ANALISIS DATA PENGGUNA KOMPLEKS
/*
dapatkan nama dan jumlah barang untuk pengguna
yang sudah membeli lebih dari 10 barang
*/
SELECT users.id, users.name, count(*) as "jumlah"
FROM sales_records
JOIN users
ON sales_records.user_id = users.id
GROUP BY users.id, users.name
HAVING Count(*) >= 10;

-- dapatkan id dan nama pengguna yang membeli "sandal"
SELECT users.id, users.name
FROM sales_records
JOIN users
ON sales_records.user_id = users.id
WHERE sales_records.item_id = (
  SELECT id
  FROM items
  WHERE name = "sandal"
)
GROUP BY users.id
;

--DATA PRODUK YANG KOMPLEKS
-- dapatkan data total penjualan untuk gender pria, wanita, dan netral
SELECT items.gender, SUM(items.price) AS "total penjualan"
FROM sales_records
JOIN items 
ON sales_records.item_id = items.id
GROUP BY items.gender
;

-- dapatkan data untuk 5 produk dengan penjualan tertinggi 
SELECT items.id, items.name, COUNT(*) AS "total penjualan"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name, items.price
ORDER BY COUNT(*) * items.price DESC
LIMIT 5
;

-- dapatkan semua barang dengan total penjualan yang lebih besar dari "hoodie abu-abu"
SELECT items.id, items.name, items.price * COUNT(*) AS "total penjualan"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name, items.price
HAVING (COUNT(*) * items.price) > (
  SELECT COUNT(*) * items.price
  FROM sales_records
  JOIN items
  ON sales_records.item_id = items.id
  WHERE items.name = "hoodie abu-abu");