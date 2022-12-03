create TabLe ogrenciler5
(
ogrenci_no char(7),-- uzunluğunu bildiğimiz string'ler için 'char' kullanılır.
isim varchar(20),--  uzunluğunu bilmediğimiz string'ler için 'varchar' kullanılır.
soyisim varchar(25),
not_ortalaması real,  -- Ondalıklı sayılar çin kullanılır (double gibi)
kayıt_tarihi date
)

-- Varolan Bir Tablodan Yeni Bir Tablo Oluşturma 
create table NOTLAR
AS 
Select isim, not_ortalaması 
from ogrenciler5;

select * from notlar;

-- INSERT - Tablo İçine Veri Ekleme 

INSERT INTO notlar VALUES ('Orhan', 95.5);
INSERT INTO notlar VALUES ('Ali', 75.5);
INSERT INTO notlar VALUES ('Musa', 45.5);
INSERT INTO notlar VALUES ('Hakan', 65.5);
INSERT INTO notlar VALUES ('Adem', 75.5);
INSERT INTO notlar VALUES ('Sumeyye', 85.5);


Create table talebeler
(
isim varchar(10),
notlar real	
);

INSERT INTO talebeler VALUES ('Orhan', 95.5);
INSERT INTO talebeler VALUES ('Ali', 75.5);
INSERT INTO talebeler VALUES ('Musa', 45.5);
INSERT INTO talebeler VALUES ('Hakan', 65.5);
INSERT INTO talebeler VALUES ('Adem', 75.5);
INSERT INTO talebeler VALUES ('Sumeyye', 85.5);

select * from talebeler;

select isim from notlar;

-- CONSTRAINT - 
-- UNIQEU

create TabLe ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ortalaması real,
kayıt_tarihi date
);

select * from ogrenciler7;

INSERT INTO ogrenciler7 VALUES ('1234567','Mikail','TUTUK',75.5,now());
INSERT INTO ogrenciler7 VALUES ('1234568','Ali','Veli',75.5,now());
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ortalaması) Values ('1234569', 'TUTUK', 85.5);-- NOT NULL kısıtlaması olduğu için bu veri eklenemez

-- PRIMARY KEY ataması

create TabLe ogrenciler8
(
ogrenci_no char(7) primary key,
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayıt_tarih date
);

-- PRIMARY KEY ataması ikinci yol
-- Eğer Constra


create TabLe ogrenciler10
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayıt_tarih date,
PRIMARY KEY(ogrenci_no)

);

--Practice 4:
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” 
--field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

create table tedarikciler3
(
	tedarikci_id char(5) Primary key,
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(20)
);

create table urunler 
(
	tedarikci_id char(5),
	urun_id char(5),
	
	foreign key(tedarikci_id) References tedarikciler3(tedarikci_id)
);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id));

select * from urunler;
select * from tedarikciler3;

--“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari 
--olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
--“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” 
--fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');-- UNIQUE CONS. olduğu için kabul etmedi
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- NOT NULL CONS. old. için kabul etmedi
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--UNIQUE CONS. kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');-- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');-- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');-- PRIMARY KEY
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar1;
select * from adresler;

-- CHECK CONSTRAINT
CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);
INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');

-- DQL -- WHERE KULLANIMI

select * from calisanlar;
select isim from calisanlar;

-- Calisanlar tablosundan maası 5000 den büyük olan isimleri listeleyiniz 
select isim,maas from calisanlar where maas>5000;

-- Calisanlar tablosundan ismi veli han olan veriyi listeleyiniz
select * from calisanlar where isim = 'Veli Han';

-- calisanlar tablosundan maası 5000 olan tüm verileri listeleyiniz 
select * from calisanlar where maas=5000;

-- DML -- DELETE komutu

DELETE FROM calisanlar; -- Eğer parent tablo başka bir child tablo ile iliskili ise önce child tablo silinmelidir
DELETE FROM adresler;
SELECT * FROM adresler;
--Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir = 'Antep';
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




