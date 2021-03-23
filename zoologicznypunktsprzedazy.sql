-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Mar 2021, 13:55
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

--
-- Zrzut danych tabeli `dzial`
--

INSERT INTO `dzial` (`NumerDzialu`, `Nazwa`, `Opis`, `ZoologicznyPunktSprzedazyIdPunktuSprzedazy`) VALUES
(0, 'Zwierzęta', 'Koty, psy, chomiki, rybki i wiele innych', 1),
(1, 'Karma', 'Jedzenie dla zwierzaków', 1),
(2, 'Zabawki', 'Zabawki dla zwierząt', 1),
(3, 'Inne', 'Pozostałe produkty', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(22);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kartaproduktow`
--

CREATE TABLE `kartaproduktow` (
  `NumerKarty` int(11) NOT NULL,
  `KoszykNumerKoszyka` int(11) NOT NULL,
  `ProduktIdProduktu` int(11) NOT NULL,
  `DataDodania` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IloscElementow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kartaproduktow`
--

INSERT INTO `kartaproduktow` (`NumerKarty`, `KoszykNumerKoszyka`, `ProduktIdProduktu`, `DataDodania`, `IloscElementow`) VALUES
(1, 1, 26, '2021-03-23 12:52:52', 4),
(2, 1, 46, '2021-03-23 12:52:52', 5),
(5, 3, 10, '2021-03-23 12:54:25', 1),
(55, 3, 41, '2021-03-23 12:54:25', 2),
(555, 3, 9, '2021-03-23 12:54:25', 3),
(5555, 3, 70, '2021-03-23 12:54:25', 4);

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
  `Opis` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `IdPunktuSprzedazy` int(11) NOT NULL,
  `KontoLoginKonta` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`NrKlienta`, `Imie`, `Nazwisko`, `Ulica`, `NumerDomu`, `Miasto`, `InneDane`, `Opis`, `IdPunktuSprzedazy`, `KontoLoginKonta`) VALUES
(22, 'admin', 'admin', 'admin', 0, 'admin', 'admin', 'admin', 1, 'admin'),
(23, 'Jakub', 'Krolik', 'Leśna', 12, 'Warszawa', NULL, '', 1, 'jakubkr6511'),
(24, 'Jan', 'Kowalski', 'Polna', 10, 'Poznań', NULL, '', 1, 'janek87111');

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

--
-- Zrzut danych tabeli `konto`
--

INSERT INTO `konto` (`Login`, `Haslo`, `Email`, `Awatar`, `DataDolaczenia`) VALUES
('admin', 'admin', 'admin@admin.com', NULL, '2021-03-22 19:42:07'),
('jakubkr6511', 'qwertyu123456545', 'jakubkr6511@ewwe.pl', NULL, '2021-03-22 19:42:53'),
('janek87111', 'janekjanek123', 'janek87111@onet.pl', NULL, '2021-03-22 19:41:40');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE `koszyk` (
  `NumerKoszyka` int(11) NOT NULL,
  `KontoLoginKonta` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `koszyk`
--

INSERT INTO `koszyk` (`NumerKoszyka`, `KontoLoginKonta`) VALUES
(1, 'admin'),
(2, 'jakubkr6511'),
(3, 'janek87111');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `IdProduktu` int(11) NOT NULL,
  `ZdjecieProduktu` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `Opis` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `Cena` int(10) NOT NULL,
  `DzialNumerDzialu` int(11) NOT NULL,
  `Nazwa` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `produkt`
--

INSERT INTO `produkt` (`IdProduktu`, `ZdjecieProduktu`, `Opis`, `Cena`, `DzialNumerDzialu`, `Nazwa`) VALUES
(0, 'https://imgur.com/glDCpbP', 'Ta pochodząca z Karaibów słodkowodna rybka jest bez wątpienia najbardziej popularną rybką akwariową. Pawie oczko, bardziej znane pod nazwą gupik, uchodzi za rybę nieskomplikowaną w pielęgnacji i nadającą się optymalnie dla poczatkujących akwarystów.', 25, 0, 'Pawie oczko'),
(1, 'https://www.zooplus.pl/magazyn/wp-content/uploads/2019/08/Neonsalmler-1024x768.jpeg', 'Za sprawą czerwonych i niebieskich neonowych pasów na ciele bystrzyka stanowi on prawdziwą wizualną atrakcję w akwarium. Te niewielkie, pochodzące z obszaru Amazonki rybki słodkowodne, pływając wyłącznie w ławicy będą czuły się w akwarium komfortowo — pow', 35, 0, 'Bystrzyk neonowy'),
(3, 'https://www.zooplus.pl/magazyn/wp-content/uploads/2019/08/black-molly.jpeg', 'Molinezja ostropyska to czarna rybka z wód Południowej i Środkowej Ameryki. Poprzez krzyżowanie z innymi odmianami hodowlanymi powstawały różne formy łusek i tak powstała Black Molly z małą, okrągłą płetwą grzbietową, o wielkości od 6 do 10 cm. Te czarne ', 32, 0, 'Black Molly'),
(4, 'https://www.zooplus.pl/magazyn/wp-content/uploads/2019/08/panzerwels-1024x683.jpeg', 'Kolejny popularny mieszkaniec naszych akwariów, należący do rodzaju Corydoras. Kiryski uwielbiają towarzystwo swoich krewnych, w ich przypadku zaleca się trzymanie w jednym akwarium kilku par z tego gatunku. Kirysek posiada gładkie, ponakładane na siebie ', 28, 0, 'Kirysek pstry'),
(7, 'https://www.zooplus.pl/magazyn/wp-content/uploads/2019/08/skalar-1024x683.jpeg', 'Skalary, zwane także żaglowcami, rzucają się w oczy ze względu na przypominający właśnie żagle kształt ciała, który zawdzięczają długim płetwom grzbietowej i odbytowej. Skalary zachwycają nie tylko niezwykłym kształtem ciała, lecz również imponują rozmiar', 32, 0, 'Skalar'),
(9, 'https://www.zooplus.pl/magazyn/wp-content/uploads/2019/08/zebrab%C3%A4rbling-1024x683.jpeg', 'Te żywotne, kochające pływać rybki cieszą się niezwykłą popularnością wśród akwarystów na całym świecie. Także osoby początkujące w dziedzinie akwarystyki z pewnością dadzą sobie radę w utrzymaniu tej niewymagającej rybki, która doskonale czuje się w towa', 45, 0, 'Danio pręgowany'),
(10, 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Chomik_syryjski_%28Just_a_Dream%29.jpg', 'Najbardziej popularnym spośród chomików jest chomiczek syryjski. Ze względu na typ włosia wyróżnia się cztery rodzaje chomiczków syryjskich: short hair czyli krótkowłosy, long hair czyli typ długowłosy, satin o włosiu satynowym, lśniącym i gładkim, oraz r', 190, 0, 'Chomiczek syryjski'),
(11, 'https://polki.pl/foto/4_3_LARGE/chomik-roborowskiego-cena-zywienie-oswajanie-chomika-2417306.jpg', 'Chomiki karłowate są ze swoją wagą od 25 do maksymalnie 50 g i długością ciała od 7 do 10 cm znacznie mniejsze od swoich krewnych, chomików syryjskich. Najdłuższy z nich, chomik chiński osiąga długość do 12 cm, jednak w tym wymiarze zawiera się jeszcze og', 231, 0, 'Chomik karłowaty'),
(20, 'https://a.allegroimg.com/s180/1131f1/0b6eedc54a898506bdb4055dd788/Tetra-Pleco-Veggie-250ml-pokarm-dla-glonojadow', 'Bogata w minerały cukinia zapewnia rybom dobre samopoczucie i witalność\r\nPokarm zawiera błonnik ułatwiający trawienie\r\nNie brudzi wody', 30, 1, 'Tetra Pleco Veggie 250ml'),
(21, 'https://media.os.fressnapf.com/products/img/1094224/1094224_8824247637717.jpg', 'Optymalne trawienie\r\nOchrona kości i stawów\r\nZawiera kwasy tłuszczowe omega-3: EPA i DHA', 380, 1, 'Royal Canin Maxi Adult 2 x 15 kg'),
(22, 'https://media.os.fressnapf.com/products/img/1099277/1099277_8840329123541.jpg', 'Z łososiem i marchewką\r\nkarma wysokiej jakości\r\nniepowtarzalny smak\r\nopracowana przez lekarzy weterynarii i specjalistów w zakresie żywienia Purina', 56, 1, 'Purina ONE Sterilcat 24 × 85 g '),
(23, 'https://media.os.fressnapf.com/products/img/1094172/1094172_8824207955669.jpg', 'Karma dla małych zwierząt jakości premium\r\nbogata w warzywa i witaminy\r\nw praktycznym wiaderku', 85, 1, 'JR Farm Super dla gryzoni 2 x 2,5 kg\r\n\r\n'),
(24, 'https://media.os.fressnapf.com/products/img/1296596/1296596_8843648784085.jpg', 'Zawiera białka zwierzęce dla zrównoważonej diety\r\nSkład bogaty w białko, które dostarcza zwierzętom energii\r\nMnóstwo orzechów i nasion, bogatych w przeciwutleniacze', 0, 1, 'Versele-Laga Versele Laga 700g'),
(25, 'https://a.allegroimg.com/s1440/038252/69c882334fa7aaa1e437cfcd8815/TROPICAL-HI-PROTEIN-DISC-XXL-POKARM-DLA-GLONOJADOW', 'Pokarm w formie tonących dysków z wysoką zawartością skorupiaków i mięczaków dla dużych gatunków mięsożernych i wszystkożernych ryb dennych\r\nWchodzące w skład pokarmu skorupiaki i mięczaki (krewetki 12%, kryl 10%, kalmary 6%, kalanus 1,7%) oraz śledzie i ', 8, 1, 'TROPICAL HI-PROTEIN DISC'),
(26, 'https://9.allegroimg.com/s720/033127/1ad4f3234399b0d7806378a5e969/GLOPEX-MIX-TABLETT-TABLETKI-POKARM-DLA-RYBEK-100g', 'Doskonale przemyślana oraz zrównoważona kombinacja wszystkich potrzebnych organizmowi ryby składników.Specjalny MIX powstał specjalnie z myślą o tych hodowcach, którzy swoje zbiorniki wodne postanowili obsadzić bardzo zróżnicowanymi gatunkami ryb ozdobnyc', 12, 1, 'GLOPEX MIX TABLETT 100g'),
(27, 'https://9.allegroimg.com/s720/012599/67cef7384967ad0476ffbcf4e7b9/TROPICAL-POKARM-WIELOSKLADNIKOWY-DLA-RYBEK', 'Wieloskładnikowy pokarm w formie płatków. Płatki to uniwersalny pokarm, który doskonale sprawdza się w akwariach wielogatunkowych. Można nim codziennie karmić większość popularnych gatunków ryb wszystkożernych. Do jego produkcji zostały użyte wyselekcjono', 10, 1, 'TROPICAL POKARM WIELOSKŁADNIKOWY'),
(40, 'https://a.allegroimg.com/s720/111e44/a61fdb9d4d67ba1099320e9debb1/Interaktywna-ZABAWKA-Pilka-z-PRZYSSAWKA-Dla-PSA-PS', 'Zabawka dla psa mocowana na przyssawkę zakończona gumową piłką, w której można schować smakołyki. Gwarantujemy, że Twój pies będzie zajęty przez długi czas.\r\nProdukt można przymocować do podłogi, ściany, płytek. Gumowa piłka z wypustkami umożliwi również ', 40, 2, 'Interaktywna ZABAWKA Piłka z PRZYSSAWKĄ'),
(41, 'https://a.allegroimg.com/s720/115237/6514ac6443afb6ff8c46eb94a452/Mocna-Zabawka-Dla-Psa-w-Ksztalcie-Kosci-Ze-Sznurem-Marka-inna', 'Mocna zabawka dla psa Dorki daje różne możliwości wykorzystania. Wychodzący sznurek z dwóch końców kości pozwala na wspólną zabawę z właścicielem - coś, co każdy pies uwielbia - ciąganie się do upadłego  Zastanawiam się tylko, czy czasem nie dają nam wygr', 60, 2, 'Mocna Zabawka Dla Psa'),
(42, 'https://a.allegroimg.com/s720/03ec36/37de2d6e438f8a5df16d79681300/GUMOWY-KURCZAK-PISZCZACA-ZABAWKA-DLA-PSA-GRYZAK-S', 'Wykonany z miękkiego, trwałego lateksu\r\nPodczas naciskania wydaje dźwięk\r\nŚwietnie nadaje się do zabaw z pupilem', 8, 2, 'KURCZAK GUMOWY PISZCZĄCY'),
(43, 'https://a.allegroimg.com/s720/111a74/ef2ca1644b7097ba1be45bc3786e/ELEKTRYCZNA-RYBA-ZABAWKA-DLA-KOTA-SKACZACA-RYBKA', 'Wysokiej jakości i miękki pluszowy materiał - Nasza zabawka z kocimiętką składa się z miękkiego i krótkiego pluszu, wysokiej jakości bawełny PP, bezpiecznej, miękkiej, wytrzymałej i bezwonnej. Idealny do zabawy, gryzienia, żucia dla Twojego kota.', 55, 2, 'ELEKTRYCZNA RYBA ZABAWKA'),
(44, 'https://a.allegroimg.com/s720/111a53/767e40484bb0b244bae094ee8822/ZABAWKA-DLA-KOTA-KOLKO-Z-MYSZKA-DRAPAK', 'Zabawka przeznaczona jest dla kotów, które uwielbiają się bawić i psocić. Dzięki tej atrakcji nie będą się nudzić. Jest to alternatywa dla polowań w naturalnym środowisku a zarazem świetna zabawa dla naszego pupila.', 35, 2, 'KÓŁKO Z MYSZKĄ DRAPAK'),
(45, 'https://a.allegroimg.com/s720/11e6ee/7a7572964b809e3310889d5d5f87', 'Śliczny mostek wykonany jest z patyczków z naturalnego drewna połączonych dwoma elastycznymi metalowymi drutami. Łatwo się wygina, aby dopasować się do różnych kształtów i rozmiarów, aby dotrzeć do podwyższonych obszarów; zachęca do odkrywania i ćwiczeń. ', 29, 2, 'Chomik Mysz Szczur Gryzonie Zabawka'),
(46, 'https://a.allegroimg.com/s720/110a7d/bd1ef61048219990f7970fd3b658/Trixie-Zabawka-gryzak-Marchewka-15-cm', 'Zabawka w postaci marchewki Trixie to doskonały wybór dla królików i gryzoni. Jest wykonana wyłącznie z naturalnych materiałów. Rolka została owinięta bawełnianą przędzą. Zabawka zapewni zwierzęciu wiele godzin zabaw oraz pomoże w naturalnym procesie ście', 14, 2, 'Trixie Zabawka gryzak'),
(47, 'https://a.allegroimg.com/s1024/1178b9/f8009b5e4f49af5a6aabf76b6f49/KERBL-Pilka-z-wikliny-10-cm-81777', 'z kwiatami i ośmioma minismakołykami do uzupełnienia\r\nz nieprzetworzonej wikliny\r\nwprowadza urozmaicenie i dba o zdrowie zębów', 23, 2, 'KERBL Piłka z wikliny, 10 cm'),
(60, 'https://a.allegroimg.com/s1024/1190c5/2449bbaa4844bb76219f63ebcec8/TRIXIE-POIDELKO-450ml-TX-6054', 'Z drucianym uchwytem i zaworem kulkowym\r\nW displayu\r\nRózne kolory', 10, 3, 'TRIXIE POIDEŁKO 450ml'),
(61, 'https://a.allegroimg.com/s1024/11ee90/56328923492099f0b6e848262a9e/KERBL-Szelki-dla-Krolika-21-35-cm', 'miękkie polarowe obicie \r\n2 metrowa smycz uchwytem typu SoftGrip \r\nkarabińczyk umożliwia szybkie zapinanie i odpinanie smyczy \r\nregulowany pasek na ramiona ', 34, 3, 'KERBL Szelki dla Królika'),
(62, 'https://a.allegroimg.com/s720/111a49/e9186a524952a65600f05035bc44/COMFY-TUBA-Z-BAWELNA-DLA-GRYZONI', 'Ekologiczne podłoże bawełniane w tubie dla gryzoni, które ulega biodegradacji. Nie szkodzi w razie spożycia. Posiada właściwości antybakteryjne oraz pochłania nieprzyjemne zapachy i wilgoć, dzięki czemu klatka jest czysta i sucha. Podłoże pakowane w rurę ', 16, 3, 'COMFY TUBA Z BAWEŁNĄ'),
(70, 'https://a.allegroimg.com/s1440/115669/0b1c7860433188e7c8532f1f130a/TRIXIE-Miska-ceramiczna-dla-krolika-z-motywem-250', 'TRIXIE Miska ceramiczna dla królika z motywem, 250 ml/ śr.11 cm ', 16, 3, 'TRIXIE Miska ceramiczna'),
(71, 'https://a.allegroimg.com/s1024/11ccf5/021a626048669eabc10c3f91b2ca/DUZY-KOJEC-ZAGRODA-DLA-PSA-PSOW-SZCZENIAT-ZWIERZAT', 'Oferujemy wysokiej jakości kojec, świetnie nadający się dla psa, jako obóz sypialny, plac zabaw, lub pomoc treningowa. Idealny do domu, na zewnątrz, oraz podczas podróży ze względu na swoją niską wagę.Kojec świetnie nadaje się również dla królików, kotów,', 160, 3, 'DUŻY KOJEC ZAGRODA');

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

--
-- Zrzut danych tabeli `transakcja`
--

INSERT INTO `transakcja` (`KodTransakcji`, `SumaTransakcji`, `IloscProduktow`, `ProduktIdProduktu`, `KlientIdKlienta`) VALUES
(1452, 600, 54, 42, 24);

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
-- Zrzut danych tabeli `zoologicznypunktsprzedazy`
--

INSERT INTO `zoologicznypunktsprzedazy` (`IdPunktuSprzedazy`, `DataPowstania`, `DataOstatniejEdycjiWitryny`, `TechnologieWykonaniaWitryny`, `Autorzy`, `Opis`) VALUES
(1, '2020-03-19 20:37:00', '2020-03-19 20:37:00', 'Java spring, Angular, HTML, SCSS, MySQL, Azure', 'Marcel Niedziela, Arkadiusz Jasze, Jakub Krolik', 'Zoologiczny internetowy punkt sprzedaży');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dzial`
--
ALTER TABLE `dzial`
  ADD PRIMARY KEY (`NumerDzialu`),
  ADD KEY `ZoologicznyPunktSprzedazyIdPunktuSprzedazy` (`ZoologicznyPunktSprzedazyIdPunktuSprzedazy`) USING BTREE;

--
-- Indeksy dla tabeli `kartaproduktow`
--
ALTER TABLE `kartaproduktow`
  ADD PRIMARY KEY (`NumerKarty`),
  ADD KEY `FK_KPK` (`KoszykNumerKoszyka`),
  ADD KEY `FK_KPP` (`ProduktIdProduktu`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`NrKlienta`),
  ADD UNIQUE KEY `KontoLoginKonta` (`KontoLoginKonta`),
  ADD KEY `IdPunktuSprzedazy` (`IdPunktuSprzedazy`);

--
-- Indeksy dla tabeli `konto`
--
ALTER TABLE `konto`
  ADD PRIMARY KEY (`Login`);

--
-- Indeksy dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`NumerKoszyka`),
  ADD KEY `FK_KK` (`KontoLoginKonta`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`IdProduktu`),
  ADD KEY `DzialNumerDzialu` (`DzialNumerDzialu`) USING BTREE;

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
  MODIFY `NumerDzialu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `kartaproduktow`
--
ALTER TABLE `kartaproduktow`
  MODIFY `NumerKarty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5556;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `NrKlienta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  MODIFY `NumerKoszyka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `IdProduktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT dla tabeli `transakcja`
--
ALTER TABLE `transakcja`
  MODIFY `KodTransakcji` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1453;

--
-- AUTO_INCREMENT dla tabeli `zoologicznypunktsprzedazy`
--
ALTER TABLE `zoologicznypunktsprzedazy`
  MODIFY `IdPunktuSprzedazy` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dzial`
--
ALTER TABLE `dzial`
  ADD CONSTRAINT `dzial_ibfk_1` FOREIGN KEY (`ZoologicznyPunktSprzedazyIdPunktuSprzedazy`) REFERENCES `zoologicznypunktsprzedazy` (`IdPunktuSprzedazy`);

--
-- Ograniczenia dla tabeli `kartaproduktow`
--
ALTER TABLE `kartaproduktow`
  ADD CONSTRAINT `FK_KPK` FOREIGN KEY (`KoszykNumerKoszyka`) REFERENCES `koszyk` (`NumerKoszyka`),
  ADD CONSTRAINT `FK_KPP` FOREIGN KEY (`ProduktIdProduktu`) REFERENCES `produkt` (`IdProduktu`);

--
-- Ograniczenia dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD CONSTRAINT `NrRP` FOREIGN KEY (`KontoLoginKonta`) REFERENCES `konto` (`Login`),
  ADD CONSTRAINT `klient_ibfk_1` FOREIGN KEY (`IdPunktuSprzedazy`) REFERENCES `zoologicznypunktsprzedazy` (`IdPunktuSprzedazy`);

--
-- Ograniczenia dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD CONSTRAINT `FK_KK` FOREIGN KEY (`KontoLoginKonta`) REFERENCES `konto` (`Login`);

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
