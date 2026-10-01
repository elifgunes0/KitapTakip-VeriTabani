CREATE DATABASE KitapTakip
USE KitapTakip

CREATE TABLE Veliler (
    VeliID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon VARCHAR(15),
    Eposta NVARCHAR(100)
)

CREATE TABLE Ogrenciler (
    OgrenciID INT IDENTITY(1,1) PRIMARY KEY,
    VeliID INT NOT NULL,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Cinsiyet NCHAR(5) CHECK (Cinsiyet IN ('Erkek', 'Kýz')),
    DogumTarihi DATE,
    FOREIGN KEY (VeliID)
    REFERENCES Veliler(VeliID) 
)

CREATE TABLE Kitaplar (
    KitapID INT IDENTITY(1,1) PRIMARY KEY,
    KitapAdi NVARCHAR(150) NOT NULL,
    YazarAdSoyad NVARCHAR(100) NOT NULL,
    SayfaSayisi INT NOT NULL CHECK (SayfaSayisi > 0),
    YayinYili INT
)

CREATE TABLE OkumaKayitlari (
    KayitID INT IDENTITY(1,1) PRIMARY KEY,
    OgrenciID INT NOT NULL,
    KitapID INT NOT NULL,
    OkumaTarihi DATE NOT NULL,
    OkumaSaati TIME NOT NULL,
    OkunanSayfaSayisi INT NOT NULL CHECK (OkunanSayfaSayisi > 0),
    OkumaSuresiDakika INT NOT NULL CHECK (OkumaSuresiDakika > 0),
    FOREIGN KEY (OgrenciID) REFERENCES Ogrenciler(OgrenciID),
    FOREIGN KEY (KitapID) REFERENCES Kitaplar(KitapID) 
)

CREATE INDEX IDX_OkumaTarihi ON OkumaKayitlari(OkumaTarihi);
CREATE INDEX IDX_OgrenciOkuma ON OkumaKayitlari(OgrenciID, OkumaTarihi);

INSERT INTO Veliler (Ad, Soyad, Telefon, Eposta) VALUES 
('Sena', 'Yýlmaz', '05321112244', 'sena@mail.com'),
('Mert', 'Çelik', '05432223366', 'mert@mail.com'),
('Aysu', 'Demir', '05553334433', 'aysu@mail.com'),
('Melih', 'Kara', '05432223677', 'melih@mail.com')

SELECT*FROM Veliler

INSERT INTO Ogrenciler (VeliID, Ad, Soyad, Cinsiyet, DogumTarihi) VALUES 
(1, 'Ömer', 'Yýlmaz', 'Erkek', '2014-05-12'),
(1, 'Zeynep', 'Yýlmaz', 'Kýz', '2016-08-20'), 
(2, 'Ali', 'Çelik', 'Erkek', '2013-02-10'),
(3, 'Elif', 'Demir', 'Kýz', '2015-11-30'),
(4, 'Duru', 'Kara', 'Kýz', '2014-12-30'),
(4, 'Demet', 'Kara', 'Kýz', '2013-10-20')

SELECT*FROM Ogrenciler

INSERT INTO Kitaplar (KitapAdi, YazarAdSoyad, SayfaSayisi, YayinYili) VALUES 
('Nutuk', 'Mustafa Kemal Atatürk', 600, 1927),
('Küçük Prens', 'Antoine de Saint-Exupéry', 112, 1943),
('Sol Ayaðým', 'Christy Brown', 192, 1954),
('Þeker Portakalý', 'José Mauro de Vasconcelos', 184, 1968),
('Momo', 'Michael Ende', 304, 1973),
('Simyacý', 'Paulo Coelho', 184, 1988),
('80 Günde DevriAlem', 'Jules Verne', 240, 1872),
('Define Adasý', 'Robert Louis Stevenson', 280, 1883),
('Beyaz Diþ', 'Jack London', 272, 1906),
('Oliver Twist', 'Charles Dickens', 416, 1838),
('Pollyanna', 'Eleanor H. Porter', 224, 1913),
('Heidi', 'Johanna Spyri', 320, 1881),
('Tom Sawyer', 'Mark Twain', 248, 1876),
('Peter Pan', 'J. M. Barrie', 160, 1911),
('Robin Hood', 'Howard Pyle', 304, 1883),
('Gulliverin Gezileri', 'Jonathan Swift', 320, 1726),
('Don Kiþot', 'Miguel de Cervantes', 512, 1605),
('Mercan Adasý', 'R. M. Ballantyne', 250, 1858),
('Sefiller', 'Victor Hugo', 400, 1862),
('Kiralýk Konak', 'Yakup Kadri Karaosmanoðlu', 232, 1922),
('Çalýkuþu', 'Reþat Nuri Güntekin', 544, 1922),
('Dokuzuncu Hariciye Koðuþu', 'Peyami Safa', 128, 1930),
('Sinekli Bakkal', 'Halide Edib Adývar', 408, 1936),
('Saatleri Ayarlama Enstitüsü', 'Ahmet Hamdi Tanpýnar', 432, 1961),
('Kürk Mantolu Madonna', 'Sabahattin Ali', 160, 1943),
('Yaban', 'Yakup Kadri Karaosmanoðlu', 214, 1932),
('Osmancýk', 'Tarýk Buðra', 392, 1983),
('Fatih-Harbiye', 'Peyami Safa', 144, 1931),
('Küçük Aða', 'Tarýk Buðra', 544, 1963),
('Sergüzeþt', 'Samipaþazade Sezai', 140, 1888)

SELECT*FROM Kitaplar

INSERT INTO OkumaKayitlari (OgrenciID, KitapID, OkumaTarihi, OkumaSaati, OkunanSayfaSayisi, OkumaSuresiDakika) VALUES 
(1, 1, '2026-06-01', '08:30:00', 15, 25), 
(1, 2, '2026-06-02', '10:15:00', 20, 30), 
(2, 3, '2026-06-01', '09:00:00', 12, 20), 
(2, 4, '2026-06-02', '14:45:00', 18, 25),
(3, 5, '2026-06-03', '11:00:00', 22, 35), 
(3, 6, '2026-06-04', '20:30:00', 30, 45), 
(4, 7, '2026-06-03', '15:20:00', 25, 40), 
(4, 8, '2026-06-05', '16:00:00', 15, 20), 
(5, 9, '2026-06-06', '10:00:00', 20, 30), 
(5, 10, '2026-06-07', '19:15:00', 25, 35), 
(6, 11, '2026-06-06', '18:00:00', 30, 45), 
(6, 12, '2026-06-08', '21:30:00', 12, 18), 
(1, 13, '2026-06-10', '08:45:00', 25, 35), 
(1, 14, '2026-06-12', '13:00:00', 40, 50), 
(2, 15, '2026-06-11', '09:30:00', 15, 22), 
(2, 16, '2026-06-13', '15:10:00', 22, 30), 
(3, 17, '2026-06-14', '11:15:00', 35, 55), 
(3, 18, '2026-06-15', '20:00:00', 18, 25),
(4, 19, '2026-06-14', '16:45:00', 20, 30), 
(4, 20, '2026-06-16', '17:30:00', 28, 40), 
(5, 21, '2026-06-17', '10:30:00', 30, 45), 
(5, 22, '2026-06-19', '19:00:00', 15, 20), 
(6, 23, '2026-06-18', '08:15:00', 22, 30), 
(6, 24, '2026-06-20', '21:00:00', 25, 35), 
(1, 25, '2026-06-21', '09:00:00', 18, 25), 
(1, 26, '2026-06-23', '14:20:00', 30, 40), 
(2, 27, '2026-06-22', '10:00:00', 15, 20), 
(2, 28, '2026-06-24', '15:40:00', 20, 30), 
(3, 29, '2026-06-25', '11:30:00', 25, 35), 
(3, 30, '2026-06-26', '20:15:00', 30, 45), 
(1, 1, '2026-07-01', '08:30:00', 20, 30), 
(1, 2, '2026-07-02', '14:00:00', 25, 35)

SELECT*FROM OkumaKayitlari

--Veli Sorgulama
SELECT VeliID, Ad, Soyad, Telefon, Eposta 
FROM Veliler;

--Öðrenci-Veli Eþleþtirmesi
SELECT o.OgrenciID,o.Ad AS OgrenciAdi,o.Soyad AS OgrenciSoyadi,o.Cinsiyet,o.DogumTarihi,
v.Ad AS VeliAdi,v.Soyad AS VeliSoyadi
FROM Ogrenciler o
INNER JOIN Veliler v
ON o.VeliID = v.VeliID;

--Kitaplarý Ýnceden Kalýna Doðru Sýralanmasý
SELECT KitapID, KitapAdi, YazarAdSoyad, SayfaSayisi, YayinYili 
FROM Kitaplar 
ORDER BY SayfaSayisi ASC;

--Hangi Öðrencinin Hangi Kitaptan, Hangi Gün ve Saatte Kaç Sayfa Okuduðunun ve Ne Kadar Süre Harcadýðýný Bulur
SELECT ok.OkumaTarihi, ok.OkumaSaati, (o.Ad + ' ' + o.Soyad) AS OgrenciAdSoyad, 
k.KitapAdi, ok.OkunanSayfaSayisi, ok.OkumaSuresiDakika
FROM OkumaKayitlari ok
INNER JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
INNER JOIN Kitaplar k ON ok.KitapID = k.KitapID
ORDER BY ok.OkumaTarihi DESC, ok.OkumaSaati DESC;


--Öðrenci Bazlý Belirli Zaman Aralýðý Sorgulama
SELECT o.Ad, o.Soyad, 
SUM(ok.OkunanSayfaSayisi) AS ToplamOkunanSayfa, 
SUM(ok.OkumaSuresiDakika) AS ToplamOkumaSuresiDakika
FROM OkumaKayitlari ok
INNER JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
WHERE ok.OgrenciID = 4 AND ok.OkumaTarihi BETWEEN '2026-06-01' AND '2026-06-30'
GROUP BY o.Ad, o.Soyad;

--Velinin Öðrencilerine Ait Belirli Zaman Aralýðý Sorgulama
SELECT v.Ad AS VeliAd, v.Soyad AS VeliSoyad, 
SUM(ok.OkunanSayfaSayisi) AS CocuklarinToplamSayfasi,
SUM(ok.OkumaSuresiDakika) AS CocuklarinToplamSuresiDakika
FROM OkumaKayitlari ok
INNER JOIN Ogrenciler o ON ok.OgrenciID = o.OgrenciID
INNER JOIN Veliler v ON o.VeliID = v.VeliID
WHERE v.VeliID = 1 AND ok.OkumaTarihi BETWEEN '2026-06-01' AND '2026-06-30'
GROUP BY v.Ad, v.Soyad;

--Günün Hangi Saat Aralýðýnda Okunan Kitap Sayfa Sayýsý Sýralamasý
SELECT DATEPART(HOUR, OkumaSaati) AS SaatDilimi, 
SUM(OkunanSayfaSayisi) AS ToplamOkunanSayfa,
COUNT(*) AS ToplamOkumaSeansi
FROM OkumaKayitlari
GROUP BY DATEPART(HOUR, OkumaSaati)
ORDER BY ToplamOkunanSayfa ASC;

--Bir Öðrenci Ýçin Ay Bazlý Günlük Okunan Sayfa Sayýsý
SELECT DATEPART(YEAR, OkumaTarihi) AS Yil,
DATEPART(MONTH, OkumaTarihi) AS Ay,OkumaTarihi AS Gun, 
SUM(OkunanSayfaSayisi) AS GunlukToplamSayfa
FROM OkumaKayitlari
WHERE OgrenciID = 3
GROUP BY DATEPART(YEAR, OkumaTarihi), DATEPART(MONTH, OkumaTarihi), OkumaTarihi
ORDER BY Yil, Ay, Gun;
