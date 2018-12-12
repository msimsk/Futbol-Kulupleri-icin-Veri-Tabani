-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 07 Ara 2018, 11:34:26
-- Sunucu sürümü: 10.1.36-MariaDB
-- PHP Sürümü: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `futbol_kulupleri_veritabani`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `basarilar`
--

CREATE TABLE `basarilar` (
  `basarilar_id` int(11) NOT NULL,
  `takimlar_id` int(11) NOT NULL,
  `adi` varchar(30) NOT NULL,
  `tarihi` date NOT NULL,
  `hakkinda` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolum`
--

CREATE TABLE `bolum` (
  `bolum_tipi_id` int(11) NOT NULL,
  `personeller_id` int(11) NOT NULL,
  `baslangıc_tarihi` date NOT NULL,
  `bitis_tarihi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolum_tipi`
--

CREATE TABLE `bolum_tipi` (
  `bolum_tipi_id` int(11) NOT NULL,
  `adi` varchar(25) NOT NULL,
  `bolum_hakkinda` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cinsiyet`
--

CREATE TABLE `cinsiyet` (
  `cinsiyet_id` bit(1) NOT NULL,
  `cinsiyet` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `giyim`
--

CREATE TABLE `giyim` (
  `giyim_id` int(11) NOT NULL,
  `kulupler_id` int(11) NOT NULL,
  `adi` varchar(20) NOT NULL,
  `renkler` char(30) NOT NULL,
  `acıklama` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakemler`
--

CREATE TABLE `hakemler` (
  `hakemler_id` int(11) NOT NULL,
  `ulkeler_id` tinyint(4) NOT NULL,
  `cinsiyet_id` bit(1) NOT NULL,
  `adi_soyadi` varchar(30) NOT NULL,
  `tel_no` int(11) NOT NULL,
  `ev_tel_no` int(11) NOT NULL,
  `email` char(50) NOT NULL,
  `adres` char(50) NOT NULL,
  `hakkinda` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullandigi_ayak`
--

CREATE TABLE `kullandigi_ayak` (
  `kullandigi_ayak_id` bit(1) NOT NULL,
  `ayak_adi` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kulupler`
--

CREATE TABLE `kulupler` (
  `kulupler_id` int(11) NOT NULL,
  `adi` varchar(25) NOT NULL,
  `kurulus_tarihi` date NOT NULL,
  `kurucular` varchar(150) NOT NULL,
  `ilk_baskan` varchar(30) NOT NULL,
  `tel_no` int(11) NOT NULL,
  `email` char(50) NOT NULL,
  `hakkinda` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ligler`
--

CREATE TABLE `ligler` (
  `ligler_id` int(11) NOT NULL,
  `adi` char(30) NOT NULL,
  `hakkinda` char(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `maclar`
--

CREATE TABLE `maclar` (
  `maclar_id` int(11) NOT NULL,
  `rakip_takim_id` int(11) NOT NULL,
  `takimlar_id` int(11) NOT NULL,
  `hakemler_id` int(11) NOT NULL,
  `tesisler_id` int(11) NOT NULL,
  `giyim_id` int(11) NOT NULL,
  `mac_tarihi` date DEFAULT NULL,
  `sonuc` varchar(5) NOT NULL,
  `hakkinda` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `materyaller`
--

CREATE TABLE `materyaller` (
  `personeller_id` int(11) NOT NULL,
  `materyaller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `materyal_tipi`
--

CREATE TABLE `materyal_tipi` (
  `materyaller_id` int(11) NOT NULL,
  `adi` varchar(25) NOT NULL,
  `adet` smallint(6) NOT NULL,
  `hakkinda` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oyuncular`
--

CREATE TABLE `oyuncular` (
  `oyuncular_id` int(11) NOT NULL,
  `ulkeler_id` tinyint(4) NOT NULL,
  `personel_id` int(11) NOT NULL,
  `takimlar_id` int(11) NOT NULL,
  `kullandıgı_ayak_id` bit(1) NOT NULL,
  `yag_orani` tinyint(4) NOT NULL,
  `serbest_kalma_bedeli` int(11) NOT NULL,
  `sozlesme_suresi` tinyint(4) DEFAULT NULL,
  `kas_orani` tinyint(4) NOT NULL,
  `kilosu` tinyint(4) NOT NULL,
  `boyu` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personeller`
--

CREATE TABLE `personeller` (
  `personeller_id` int(11) NOT NULL,
  `kulupler_id` int(11) NOT NULL,
  `cinsiyet_id` bit(1) NOT NULL,
  `adi_soyadi` varchar(30) NOT NULL,
  `tel_no` int(11) NOT NULL,
  `ev_tel_no` int(11) DEFAULT NULL,
  `email` char(50) NOT NULL,
  `dogum_tarihi` date NOT NULL,
  `yillik_maas` int(11) NOT NULL,
  `hakkinda` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pozisyonlar`
--

CREATE TABLE `pozisyonlar` (
  `pozisyonlar_id` tinyint(4) NOT NULL,
  `oyuncular_id` int(11) NOT NULL,
  `adi` varchar(20) DEFAULT NULL,
  `konumu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sakatlik_durumu`
--

CREATE TABLE `sakatlik_durumu` (
  `sakatlik_durumu_id` int(11) NOT NULL,
  `oyuncular_id` int(11) NOT NULL,
  `sakatlik_adi` varchar(20) NOT NULL,
  `yapilan_uygulama` char(50) NOT NULL,
  `sakatlik_tarihi` date NOT NULL,
  `iyilesme_tarihi` date NOT NULL,
  `aciklama` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `takimlar`
--

CREATE TABLE `takimlar` (
  `takimlar_id` int(11) NOT NULL,
  `ligler_id` int(11) NOT NULL,
  `kulupler_id` int(11) NOT NULL,
  `adi` varchar(20) NOT NULL,
  `hakkinda` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `taktikler`
--

CREATE TABLE `taktikler` (
  `taktikler_id` int(11) NOT NULL,
  `maclar_id` int(11) NOT NULL,
  `adi` varchar(20) NOT NULL,
  `aciklama` char(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tesisler`
--

CREATE TABLE `tesisler` (
  `tesisler_id` int(11) NOT NULL,
  `kulupler_id` int(11) NOT NULL,
  `adi` varchar(25) NOT NULL,
  `adresi` char(70) NOT NULL,
  `tel_no` int(11) NOT NULL,
  `diger_detaylar` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ulkeler`
--

CREATE TABLE `ulkeler` (
  `ulkeler_id` tinyint(4) NOT NULL,
  `ulke_adi` varchar(30) NOT NULL,
  `aciklama` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `basarilar`
--
ALTER TABLE `basarilar`
  ADD PRIMARY KEY (`basarilar_id`),
  ADD KEY `takimlar_id` (`takimlar_id`);

--
-- Tablo için indeksler `bolum`
--
ALTER TABLE `bolum`
  ADD KEY `bolum_tipi_id` (`bolum_tipi_id`,`personeller_id`),
  ADD KEY `personeller_id` (`personeller_id`);

--
-- Tablo için indeksler `bolum_tipi`
--
ALTER TABLE `bolum_tipi`
  ADD PRIMARY KEY (`bolum_tipi_id`);

--
-- Tablo için indeksler `cinsiyet`
--
ALTER TABLE `cinsiyet`
  ADD PRIMARY KEY (`cinsiyet_id`);

--
-- Tablo için indeksler `giyim`
--
ALTER TABLE `giyim`
  ADD PRIMARY KEY (`giyim_id`),
  ADD KEY `kulup_id` (`kulupler_id`);

--
-- Tablo için indeksler `hakemler`
--
ALTER TABLE `hakemler`
  ADD PRIMARY KEY (`hakemler_id`),
  ADD KEY `uyruklar_id` (`ulkeler_id`),
  ADD KEY `cinsiyet_id` (`cinsiyet_id`);

--
-- Tablo için indeksler `kullandigi_ayak`
--
ALTER TABLE `kullandigi_ayak`
  ADD PRIMARY KEY (`kullandigi_ayak_id`);

--
-- Tablo için indeksler `kulupler`
--
ALTER TABLE `kulupler`
  ADD PRIMARY KEY (`kulupler_id`);

--
-- Tablo için indeksler `ligler`
--
ALTER TABLE `ligler`
  ADD PRIMARY KEY (`ligler_id`);

--
-- Tablo için indeksler `maclar`
--
ALTER TABLE `maclar`
  ADD PRIMARY KEY (`maclar_id`),
  ADD KEY `rakip_kulup_id` (`rakip_takim_id`,`takimlar_id`,`giyim_id`),
  ADD KEY `takimlar_id` (`takimlar_id`),
  ADD KEY `giyim_id` (`giyim_id`),
  ADD KEY `maclar_hakemler_id_index` (`hakemler_id`),
  ADD KEY `maclar_tesisler_id_index` (`tesisler_id`);

--
-- Tablo için indeksler `materyaller`
--
ALTER TABLE `materyaller`
  ADD KEY `personeller_id` (`personeller_id`,`materyaller_id`),
  ADD KEY `materyaller_id` (`materyaller_id`);

--
-- Tablo için indeksler `materyal_tipi`
--
ALTER TABLE `materyal_tipi`
  ADD PRIMARY KEY (`materyaller_id`);

--
-- Tablo için indeksler `oyuncular`
--
ALTER TABLE `oyuncular`
  ADD PRIMARY KEY (`oyuncular_id`),
  ADD KEY `personel_id` (`personel_id`,`takimlar_id`),
  ADD KEY `takimlar_id` (`takimlar_id`),
  ADD KEY `kullandıgı_ayak_id` (`kullandıgı_ayak_id`),
  ADD KEY `ulkeler_id` (`ulkeler_id`);

--
-- Tablo için indeksler `personeller`
--
ALTER TABLE `personeller`
  ADD PRIMARY KEY (`personeller_id`),
  ADD KEY `kulupler_id` (`kulupler_id`),
  ADD KEY `cinsiyet_id` (`cinsiyet_id`);

--
-- Tablo için indeksler `pozisyonlar`
--
ALTER TABLE `pozisyonlar`
  ADD PRIMARY KEY (`pozisyonlar_id`),
  ADD KEY `oyuncular_id` (`oyuncular_id`);

--
-- Tablo için indeksler `sakatlik_durumu`
--
ALTER TABLE `sakatlik_durumu`
  ADD PRIMARY KEY (`sakatlik_durumu_id`),
  ADD KEY `oyuncular_id` (`oyuncular_id`);

--
-- Tablo için indeksler `takimlar`
--
ALTER TABLE `takimlar`
  ADD PRIMARY KEY (`takimlar_id`),
  ADD KEY `ligler_id` (`ligler_id`),
  ADD KEY `takimlar_kulupler_kulupler_id_fk` (`kulupler_id`);

--
-- Tablo için indeksler `taktikler`
--
ALTER TABLE `taktikler`
  ADD PRIMARY KEY (`taktikler_id`),
  ADD KEY `maclar_id` (`maclar_id`);

--
-- Tablo için indeksler `tesisler`
--
ALTER TABLE `tesisler`
  ADD PRIMARY KEY (`tesisler_id`),
  ADD KEY `kulup_id` (`kulupler_id`);

--
-- Tablo için indeksler `ulkeler`
--
ALTER TABLE `ulkeler`
  ADD PRIMARY KEY (`ulkeler_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `basarilar`
--
ALTER TABLE `basarilar`
  MODIFY `basarilar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `bolum_tipi`
--
ALTER TABLE `bolum_tipi`
  MODIFY `bolum_tipi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `giyim`
--
ALTER TABLE `giyim`
  MODIFY `giyim_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `hakemler`
--
ALTER TABLE `hakemler`
  MODIFY `hakemler_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kulupler`
--
ALTER TABLE `kulupler`
  MODIFY `kulupler_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ligler`
--
ALTER TABLE `ligler`
  MODIFY `ligler_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `maclar`
--
ALTER TABLE `maclar`
  MODIFY `maclar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `materyal_tipi`
--
ALTER TABLE `materyal_tipi`
  MODIFY `materyaller_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `oyuncular`
--
ALTER TABLE `oyuncular`
  MODIFY `oyuncular_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `personeller`
--
ALTER TABLE `personeller`
  MODIFY `personeller_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pozisyonlar`
--
ALTER TABLE `pozisyonlar`
  MODIFY `pozisyonlar_id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `sakatlik_durumu`
--
ALTER TABLE `sakatlik_durumu`
  MODIFY `sakatlik_durumu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `takimlar`
--
ALTER TABLE `takimlar`
  MODIFY `takimlar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `taktikler`
--
ALTER TABLE `taktikler`
  MODIFY `taktikler_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tesisler`
--
ALTER TABLE `tesisler`
  MODIFY `tesisler_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ulkeler`
--
ALTER TABLE `ulkeler`
  MODIFY `ulkeler_id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `basarilar`
--
ALTER TABLE `basarilar`
  ADD CONSTRAINT `basarilar_ibfk_1` FOREIGN KEY (`takimlar_id`) REFERENCES `takimlar` (`takimlar_id`);

--
-- Tablo kısıtlamaları `bolum`
--
ALTER TABLE `bolum`
  ADD CONSTRAINT `bolum_ibfk_1` FOREIGN KEY (`bolum_tipi_id`) REFERENCES `bolum_tipi` (`bolum_tipi_id`),
  ADD CONSTRAINT `bolum_ibfk_2` FOREIGN KEY (`personeller_id`) REFERENCES `personeller` (`personeller_id`);

--
-- Tablo kısıtlamaları `giyim`
--
ALTER TABLE `giyim`
  ADD CONSTRAINT `giyim_ibfk_1` FOREIGN KEY (`kulupler_id`) REFERENCES `kulupler` (`kulupler_id`);

--
-- Tablo kısıtlamaları `hakemler`
--
ALTER TABLE `hakemler`
  ADD CONSTRAINT `hakemler_cinsiyet_cinsiyet_id_fk` FOREIGN KEY (`cinsiyet_id`) REFERENCES `cinsiyet` (`cinsiyet_id`),
  ADD CONSTRAINT `hakemler_ibfk_4` FOREIGN KEY (`ulkeler_id`) REFERENCES `ulkeler` (`ulkeler_id`);

--
-- Tablo kısıtlamaları `maclar`
--
ALTER TABLE `maclar`
  ADD CONSTRAINT `maclar_ibfk_1` FOREIGN KEY (`takimlar_id`) REFERENCES `takimlar` (`takimlar_id`),
  ADD CONSTRAINT `maclar_ibfk_2` FOREIGN KEY (`rakip_takim_id`) REFERENCES `takimlar` (`takimlar_id`),
  ADD CONSTRAINT `maclar_ibfk_3` FOREIGN KEY (`giyim_id`) REFERENCES `giyim` (`giyim_id`),
  ADD CONSTRAINT `maclar_ibfk_4` FOREIGN KEY (`hakemler_id`) REFERENCES `hakemler` (`hakemler_id`),
  ADD CONSTRAINT `maclar_tesisler_tesisler_id_fk` FOREIGN KEY (`tesisler_id`) REFERENCES `tesisler` (`tesisler_id`);

--
-- Tablo kısıtlamaları `materyaller`
--
ALTER TABLE `materyaller`
  ADD CONSTRAINT `materyaller_ibfk_1` FOREIGN KEY (`materyaller_id`) REFERENCES `materyal_tipi` (`materyaller_id`),
  ADD CONSTRAINT `materyaller_ibfk_2` FOREIGN KEY (`personeller_id`) REFERENCES `personeller` (`personeller_id`);

--
-- Tablo kısıtlamaları `oyuncular`
--
ALTER TABLE `oyuncular`
  ADD CONSTRAINT `oyuncular_ibfk_1` FOREIGN KEY (`personel_id`) REFERENCES `personeller` (`personeller_id`),
  ADD CONSTRAINT `oyuncular_ibfk_2` FOREIGN KEY (`takimlar_id`) REFERENCES `takimlar` (`takimlar_id`),
  ADD CONSTRAINT `oyuncular_ibfk_4` FOREIGN KEY (`ulkeler_id`) REFERENCES `ulkeler` (`ulkeler_id`),
  ADD CONSTRAINT `oyuncular_kullandigi_ayak_kullandigi_ayak_id_fk` FOREIGN KEY (`kullandıgı_ayak_id`) REFERENCES `kullandigi_ayak` (`kullandigi_ayak_id`);

--
-- Tablo kısıtlamaları `personeller`
--
ALTER TABLE `personeller`
  ADD CONSTRAINT `personeller_cinsiyet_cinsiyet_id_fk` FOREIGN KEY (`cinsiyet_id`) REFERENCES `cinsiyet` (`cinsiyet_id`),
  ADD CONSTRAINT `personeller_ibfk_1` FOREIGN KEY (`kulupler_id`) REFERENCES `kulupler` (`kulupler_id`);

--
-- Tablo kısıtlamaları `pozisyonlar`
--
ALTER TABLE `pozisyonlar`
  ADD CONSTRAINT `pozisyonlar_ibfk_1` FOREIGN KEY (`oyuncular_id`) REFERENCES `oyuncular` (`oyuncular_id`);

--
-- Tablo kısıtlamaları `sakatlik_durumu`
--
ALTER TABLE `sakatlik_durumu`
  ADD CONSTRAINT `sakatlik_durumu_ibfk_1` FOREIGN KEY (`oyuncular_id`) REFERENCES `oyuncular` (`oyuncular_id`);

--
-- Tablo kısıtlamaları `takimlar`
--
ALTER TABLE `takimlar`
  ADD CONSTRAINT `takimlar_ibfk_1` FOREIGN KEY (`ligler_id`) REFERENCES `ligler` (`ligler_id`),
  ADD CONSTRAINT `takimlar_kulupler_kulupler_id_fk` FOREIGN KEY (`kulupler_id`) REFERENCES `kulupler` (`kulupler_id`);

--
-- Tablo kısıtlamaları `taktikler`
--
ALTER TABLE `taktikler`
  ADD CONSTRAINT `taktikler_ibfk_1` FOREIGN KEY (`maclar_id`) REFERENCES `maclar` (`maclar_id`);

--
-- Tablo kısıtlamaları `tesisler`
--
ALTER TABLE `tesisler`
  ADD CONSTRAINT `tesisler_ibfk_1` FOREIGN KEY (`kulupler_id`) REFERENCES `kulupler` (`kulupler_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
