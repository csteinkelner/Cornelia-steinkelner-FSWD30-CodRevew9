-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Feb 2018 um 17:40
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_cornelia_steinkelner_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `fk_drop_off_id` int(11) DEFAULT NULL,
  `fk_reason_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `fk_drop_off_id`, `fk_reason_id`, `amount`) VALUES
(1, 1, 1, 10),
(2, 2, 2, 20);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `fk_car_type_id` int(11) DEFAULT NULL,
  `state_of_car` varchar(55) DEFAULT NULL,
  `fuel_stand` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_id`, `fk_car_type_id`, `state_of_car`, `fuel_stand`) VALUES
(1, 3, 'good, without comment', 'full'),
(2, 1, 'good, scratch on left front', 'full');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_type`
--

CREATE TABLE `car_type` (
  `car_type_id` int(11) NOT NULL,
  `car_type` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car_type`
--

INSERT INTO `car_type` (`car_type_id`, `car_type`) VALUES
(1, 'VW'),
(2, 'Toyota'),
(3, 'BMW'),
(4, 'renault'),
(5, 'ford');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `surname` varchar(55) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phonenumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_id`, `name`, `surname`, `age`, `email`, `phonenumber`) VALUES
(1, 'John', 'Doe', 30, 'joedow@gmail.com', 123123),
(2, 'maria', 'manson', 20, 'mamanson@chello.at', 3456123);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drop_off`
--

CREATE TABLE `drop_off` (
  `drop_off_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_endlocation_id` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `drop_off`
--

INSERT INTO `drop_off` (`drop_off_id`, `fk_car_id`, `fk_endlocation_id`, `date_time`) VALUES
(1, 1, 1, '2018-02-02 16:34:23'),
(2, 2, 1, '2018-02-02 16:34:35');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `endlocation`
--

CREATE TABLE `endlocation` (
  `endlocation_id` int(11) NOT NULL,
  `addres` varchar(80) DEFAULT NULL,
  `state_of_car_now` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `endlocation`
--

INSERT INTO `endlocation` (`endlocation_id`, `addres`, `state_of_car_now`) VALUES
(1, 'schönbrunn-1-1130 Wien', 'unchanged'),
(2, '4040 goßstraße', 'scratches on back');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `date_of_payment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_driver_id`, `price`, `date_of_payment`) VALUES
(1, 1, 60, '2017-12-13'),
(2, 2, 80, '2018-01-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pick_up`
--

CREATE TABLE `pick_up` (
  `pick_up_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_startlocation_id` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `pick_up`
--

INSERT INTO `pick_up` (`pick_up_id`, `fk_car_id`, `fk_startlocation_id`, `date_time`) VALUES
(1, 1, 1, '2018-02-02 16:35:50'),
(2, 2, 2, '2018-02-02 16:35:58');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reason_for_extracarge`
--

CREATE TABLE `reason_for_extracarge` (
  `reason_id` int(11) NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `charge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reason_for_extracarge`
--

INSERT INTO `reason_for_extracarge` (`reason_id`, `reason`, `charge`) VALUES
(1, 'minor_damage', 5),
(2, 'damage', 20),
(3, 'sirious_damage', 200);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rent`
--

CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `rent_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `rent`
--

INSERT INTO `rent` (`rent_id`, `fk_driver_id`, `fk_car_id`, `rent_date`) VALUES
(1, 1, 1, '2018-02-01'),
(2, 2, 2, '2018-01-08');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_driver_id`, `starting_date`, `end_date`) VALUES
(1, 1, '2017-08-22', '2017-08-23');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `startlocation`
--

CREATE TABLE `startlocation` (
  `startlocation_id` int(11) NOT NULL,
  `addres` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `startlocation`
--

INSERT INTO `startlocation` (`startlocation_id`, `addres`) VALUES
(1, '1120wien blubstraße'),
(2, '3020 niederösterreich ödland');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `fk_drop_off_id` (`fk_drop_off_id`),
  ADD KEY `fk_reason_id` (`fk_reason_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_car_type_id` (`fk_car_type_id`);

--
-- Indizes für die Tabelle `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`car_type_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `drop_off`
--
ALTER TABLE `drop_off`
  ADD PRIMARY KEY (`drop_off_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_endlocation_id` (`fk_endlocation_id`);

--
-- Indizes für die Tabelle `endlocation`
--
ALTER TABLE `endlocation`
  ADD PRIMARY KEY (`endlocation_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indizes für die Tabelle `pick_up`
--
ALTER TABLE `pick_up`
  ADD PRIMARY KEY (`pick_up_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_startlocation_id` (`fk_startlocation_id`);

--
-- Indizes für die Tabelle `reason_for_extracarge`
--
ALTER TABLE `reason_for_extracarge`
  ADD PRIMARY KEY (`reason_id`);

--
-- Indizes für die Tabelle `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indizes für die Tabelle `startlocation`
--
ALTER TABLE `startlocation`
  ADD PRIMARY KEY (`startlocation_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_drop_off_id`) REFERENCES `drop_off` (`drop_off_id`),
  ADD CONSTRAINT `additional_charges_ibfk_2` FOREIGN KEY (`fk_reason_id`) REFERENCES `reason_for_extracarge` (`reason_id`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_car_type_id`) REFERENCES `car_type` (`car_type_id`);

--
-- Constraints der Tabelle `drop_off`
--
ALTER TABLE `drop_off`
  ADD CONSTRAINT `drop_off_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `drop_off_ibfk_2` FOREIGN KEY (`fk_endlocation_id`) REFERENCES `endlocation` (`endlocation_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`);

--
-- Constraints der Tabelle `pick_up`
--
ALTER TABLE `pick_up`
  ADD CONSTRAINT `pick_up_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `pick_up_ibfk_2` FOREIGN KEY (`fk_startlocation_id`) REFERENCES `startlocation` (`startlocation_id`);

--
-- Constraints der Tabelle `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
