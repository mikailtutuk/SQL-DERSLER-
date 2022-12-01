-- Database (VeriTabanı) oluşturma 

create database mikail;

-- DDL - DATA DEFINITION LANG.
-- CREATE - Tablo oluşturma 
create TabLe ogrenciler1
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ortalaması real,  -- Ondalıklı sayılar çin kullanılır (double gibi)
kayıt_tarihi date
)

-- Var olan tablodan yeni bir tablo oluşturma 
Create table ogrenciler2
as select isim, soyisim, not_ortalaması, -- Benzer tablodaki başlıklarla ve data type'leri ile
-- yeni bir tablo oluşturmak için normal tablo oluştururkenki parantezler yerine AS kullanıp 
-- Select komutuyla almak istediğimiz verileri alırız
from ogrenciler1;

-- DML - DATA MANUPULATION LANG.
-- INSERT (Database'e Veri Ekleme)

Insert into ogrenciler1 values ('1234567', 'Said', 'ILHAN',85.5,now());
Insert into ogrenciler1 values ('1234567', 'Said', 'ILHAN',85.5,'2020-12-11');

-- BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK

INSErT into ogrenciler1 (isim,soyisim) valueS ('Erol', 'Evren');


-- DQL - DATA QUERY LANG.
-- SELECT

select * from ogrenciler1; -- Burdaki * sembolü herşeyi kaydeder

























