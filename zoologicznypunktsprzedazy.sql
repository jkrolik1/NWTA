-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Mar 2021, 20:07
-- Wersja serwera: 10.4.18-MariaDB
-- Wersja PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zoologicznypunktsprzedazy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzial`
--

CREATE TABLE `dzial` (
  `NumerDzialu` int(11) NOT NULL,
  `Nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `Opis` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `ZoologicznyPunktSprzedazyIdPunktuSprzedazy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `NrKlienta` int(10) NOT NULL,
  `Imie` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `Ulica` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `NumerDomu` int(10) NOT NULL,
  `Miasto` varchar(200) COLLATE utf8_polish_ci DEFAULT NULL,
  `InneDane` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `Opis` int(255) NOT NULL,
  `IdPunktuSprzedazy` int(11) NOT NULL,
  `KontoLoginKonta` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konto`
--

CREATE TABLE `konto` (
  `Login` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Haslo` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Awatar` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `DataDolaczenia` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `IdProduktu` int(11) NOT NULL,
  `ZdjeciePogladowe` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `Opis` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `Cena` int(10) NOT NULL,
  `DzialNumerDzialu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transakcja`
--

CREATE TABLE `transakcja` (
  `KodTransakcji` int(10) NOT NULL,
  `SumaTransakcji` int(10) DEFAULT NULL,
  `IloscProduktow` int(10) DEFAULT NULL,
  `ProduktIdProduktu` int(11) NOT NULL,
  `KlientIdKlienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zoologicznypunktsprzedazy`
--

CREATE TABLE `zoologicznypunktsprzedazy` (
  `IdPunktuSprzedazy` int(10) NOT NULL,
  `DataPowstania` timestamp NULL DEFAULT NULL,
  `DataOstatniejEdycjiWitryny` timestamp NULL DEFAULT NULL,
  `TechnologieWykonaniaWitryny` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `Autorzy` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `Opis` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dzial`
--
ALTER TABLE `dzial`
  ADD PRIMARY KEY (`NumerDzialu`),
  ADD UNIQUE KEY `ZoologicznyPunktSprzedazyIdPunktuSprzedazy` (`ZoologicznyPunktSprzedazyIdPunktuSprzedazy`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`NrKlienta`),
  ADD UNIQUE KEY `IdPunktuSprzedazy` (`IdPunktuSprzedazy`),
  ADD UNIQUE KEY `KontoLoginKonta` (`KontoLoginKonta`);

--
-- Indeksy dla tabeli `konto`
--
ALTER TABLE `konto`
  ADD PRIMARY KEY (`Login`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`IdProduktu`),
  ADD UNIQUE KEY `DzialNumerDzialu` (`DzialNumerDzialu`);

--
-- Indeksy dla tabeli `transakcja`
--
ALTER TABLE `transakcja`
  ADD PRIMARY KEY (`KodTransakcji`),
  ADD UNIQUE KEY `KlientIdKlienta` (`KlientIdKlienta`),
  ADD UNIQUE KEY `ProduktIdProduktu` (`ProduktIdProduktu`);

--
-- Indeksy dla tabeli `zoologicznypunktsprzedazy`
--
ALTER TABLE `zoologicznypunktsprzedazy`
  ADD PRIMARY KEY (`IdPunktuSprzedazy`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dzial`
--
ALTER TABLE `dzial`
  MODIFY `NumerDzialu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `NrKlienta` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `IdProduktu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `transakcja`
--
ALTER TABLE `transakcja`
  MODIFY `KodTransakcji` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zoologicznypunktsprzedazy`
--
ALTER TABLE `zoologicznypunktsprzedazy`
  MODIFY `IdPunktuSprzedazy` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dzial`
--
ALTER TABLE `dzial`
  ADD CONSTRAINT `dzial_ibfk_1` FOREIGN KEY (`ZoologicznyPunktSprzedazyIdPunktuSprzedazy`) REFERENCES `zoologicznypunktsprzedazy` (`IdPunktuSprzedazy`);

--
-- Ograniczenia dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD CONSTRAINT `NrKPO` FOREIGN KEY (`IdPunktuSprzedazy`) REFERENCES `zoologicznypunktsprzedazy` (`IdPunktuSprzedazy`),
  ADD CONSTRAINT `NrRP` FOREIGN KEY (`KontoLoginKonta`) REFERENCES `konto` (`Login`);

--
-- Ograniczenia dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`DzialNumerDzialu`) REFERENCES `dzial` (`NumerDzialu`);

--
-- Ograniczenia dla tabeli `transakcja`
--
ALTER TABLE `transakcja`
  ADD CONSTRAINT `NrK` FOREIGN KEY (`KlientIdKlienta`) REFERENCES `klient` (`NrKlienta`),
  ADD CONSTRAINT `NrP` FOREIGN KEY (`ProduktIdProduktu`) REFERENCES `produkt` (`IdProduktu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
