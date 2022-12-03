CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler3

-- İsmi Mustafa Bak ve Nesibe Yılmaz olan kayıtları silelim

DELETE from ogrenciler3 where isim= 'Mustafa Bak' or isim = 'Nesibe Yilmaz'

-- veli ismi hasan datayı silelim

delete from ogrenciler3 where veli_isim= 'Hasan';

-- TRUNCATE --
-- Bir tablodaki tüm verileri geri almayacağımız şekilde siler. Şartlı silme yapmaz 

TRUNCATE TABLE ogrenciler3

-- ON DELETE CASCADE
DROP TABLE if exists adresler -- Eğer tablo varsa tabloyu siler 
CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id))
on delete cascade
);
INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebe1;
select * from not2;

-- notlar tablosundan id'si 123 olan datayı silelim 
delete from notlar where talebe_id = '123';

-- talebeler tablosundan id'si 126 olan datayı silelim
delete from talebe1 where id='126'

CREATE TABLE talebe1
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO talebe1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe1 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe1 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe1 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe1 VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE not2(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe1(id))
on delete cascade
);

INSERT INTO not2 VALUES ('123','kimya',75);
INSERT INTO not2 VALUES ('124', 'fizik',65);
INSERT INTO not2 VALUES ('125', 'tarih',90);
INSERT INTO not2 VALUES ('126', 'Matematik',90);

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/

-- IN CONDITION

DROP TABLE if exists musteriler

CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler;

-- Musteriler tablosundan ürün ismi orange apple apricot olan verileri listeleyiniz 
SELECT  * FROM musteriler where urun_isim= 'Orange' OR urun_isim='Apple' OR urun_isim='Apricot';

-- IN CONDITION
SELECT  * FROM musteriler where urun_isim IN('Orange','Apple','Apricot');

-- NOT IN --> Yazdığımız verilerin dışındakilerini getirir.
SELECT  * FROM musteriler WHERE urun_isim NOT IN('Orange','Apple','Apricot');

-- BETWEEN CONDITION 

-- Müşeriler tablosundan id'si 20 ile 40 arasında olan verileri listeleyiniz 
SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;

SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40;

-- NOT BETWEEN --
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40;

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', null, 'Vakko');

DELETE FROM calisanlar2

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin
-- isimlerini ve maaşlarini listeleyin.

SELECT isim,maas,isyeri FROM calisanlar2 
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin 
-- isim, maaş ve şehirlerini listeleyiniz.

SELECT isim,maas,sehir FROM calisanlar2 
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);
/*
--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
*/

-- AGGREGATE METHOD 

--Calisanlar tablosunda maksimum maası listeleyiniz
SELECT max(maas) AS maksimum_maas FROM calisanlar2;
/*
	Eğer bir sütuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek
istediğimiz ismi yazarız 
*/

--Calisanlar tablosunda minimum maası listeleyiniz
SELECT min(maas) AS minimum_maas FROM calisanlar2;

--Calisanlar tablosundaki maasların toplamını listeleyiniz
SELECT sum(maas) AS maas_toplamı FROM calisanlar2;

--Calisanlar tablosundaki maasların ortalamasını listeleyiniz 
SELECT avg(maas) AS maas_ortalaması FROM calisanlar2;
SELECT round(avg(maas),2) AS maas_ortalaması FROM calisanlar2;

--Calisanlar tablosundaki maasların sayısı 
SELECT count(maas) AS maas_sayısı FROM calisanlar2;
SELECT count(*) AS maas_sayısı FROM calisanlar2;
/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/
SELECT * FROM calisanlar2;
SELECT * FROM markalar;
-- AGGREGATE METHODLARDA SUBQUERY
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
-- listeleyen bir SORGU yaziniz

SELECT marka_id,marka_isim,
(SELECT count(sehir) AS sehir_sayısı FROM calisanlar2 WHERE marka_isim=isyeri) 
FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
CREATE VIEW summaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT sum(maas) FROM calisanlar2 WHERE isyeri=marka_isim ) AS toplam_maas
FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve 
-- minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim ) as en_yüksek_maas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim ) as en_düşük_maas
FROM markalar;

-- VIEW Kullanımı
/*
Yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine 
view'e atadığımız ismi SELECT komutuyla çağırırız
*/
CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar;
SELECT * FROM maxminmaas;
SELECT * FROM summaas;

-- EXİSTS CONDITION "varsa getir anlamı katar"

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart;
SELECT * FROM nisan;
/*
-- MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
-- URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
-- MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
*/
SELECT musteri_isim,urun_id FROM mart 
WHERE exists (SELECT urun_id FROM nisan WHERE mart.urun_id = nisan.urun_id)
/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
SELECT musteri_isim,urun_isim FROM nisan 
WHERE exists (SELECT urun_isim FROM mart WHERE mart.urun_isim = nisan.urun_isim)

/*                   ÖDEVVVV
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
 NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/

-- DML --> UPDATE <--

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

DELETE FROM urunler

CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

SELECT * FROM tedarikciler;
SELECT * FROM urunler;

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
/*
UPDATE tablo_adi
SET sütun_ismi = 'istenen veri' WHERE sütun_ismi='istenen veri'
*/
UPDATE tedarikciler 
SET firma_ismi = 'Vestel' WHERE vergi_no = '102'

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve 
--irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler 
SET firma_ismi = 'Casper', irtibat_ismi = 'Ali Veli' WHERE vergi_no = '101'

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler 
SET urun_isim = 'Telefon' WHERE urun_isim= 'Phone' 

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler 
SET urun_id = urun_id + 1 WHERE urun_id>1004;

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler 
SET urun_id = urun_id+ted_vergino;

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
UPDATE urunler 
SET urun_isim = (SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi = 'Adam Eve' )
WHERE musteri_isim='Ali Bak';

-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler 
SET musteri_isim= (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi = 'Apple' )
WHERE urun_isim= 'Laptop';





