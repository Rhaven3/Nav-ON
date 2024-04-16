-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql.info.unicaen.fr:3306
-- Généré le : mar. 16 avr. 2024 à 09:23
-- Version du serveur :  10.11.4-MariaDB-1~deb12u1-log
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ledanoi232_7`
--

-- --------------------------------------------------------

--
-- Structure de la table `COMPTE`
--

CREATE TABLE `COMPTE` (
  `login` varchar(20) NOT NULL,
  `mdp` varchar(35) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `numtel` varchar(12) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `ville` varchar(30) DEFAULT NULL,
  `issub` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `COMPTE`
--

INSERT INTO `COMPTE` (`login`, `mdp`, `email`, `numtel`, `nom`, `prenom`, `ville`, `issub`) VALUES
('Ledanoisb', 'hackaton', 'ledanoisb@gmail.com', '06', 'Ledanois', 'Brice', 'Avranches', 0),
('ouais', '', '', '', '', '', '', 0),
('Skycun', 'ouaisouaisouais', 'ouaisouaisouais@gmail.com', '06', 'ledanois', 'brice', 'Avranches', 0);

-- --------------------------------------------------------

--
-- Structure de la table `EVENEMENT`
--

CREATE TABLE `EVENEMENT` (
  `idevent` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `nom` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `nbparticipant` int(11) DEFAULT NULL,
  `statut` text DEFAULT NULL,
  `webcam` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `HISTORIQUE`
--

CREATE TABLE `HISTORIQUE` (
  `login` varchar(20) NOT NULL,
  `idevent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `MESSAGE`
--

CREATE TABLE `MESSAGE` (
  `idmessage` int(11) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `reciver` varchar(20) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `PROFILE`
--

CREATE TABLE `PROFILE` (
  `idprofile` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `bio` text DEFAULT NULL,
  `profilpic` text DEFAULT NULL,
  `statut` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `SUPPORT`
--

CREATE TABLE `SUPPORT` (
  `idsupport` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `niveau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `SUPPORT`
--

INSERT INTO `SUPPORT` (`idsupport`, `nom`, `niveau`) VALUES
(1, 'Catamaran', 1),
(2, 'Catamaran', 2),
(3, 'Catamaran', 3),
(4, 'Catamaran', 4),
(5, 'Surf', 1),
(6, 'Surf', 2),
(7, 'Surf', 3),
(8, 'Surf', 4),
(9, 'Voile', 1),
(10, 'Voile', 2),
(11, 'Voile', 3),
(12, 'Voile', 4);

-- --------------------------------------------------------

--
-- Structure de la table `UTILISE_SUPPORT`
--

CREATE TABLE `UTILISE_SUPPORT` (
  `idsupport` int(11) NOT NULL,
  `login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `COMPTE`
--
ALTER TABLE `COMPTE`
  ADD PRIMARY KEY (`login`);

--
-- Index pour la table `EVENEMENT`
--
ALTER TABLE `EVENEMENT`
  ADD PRIMARY KEY (`idevent`);

--
-- Index pour la table `HISTORIQUE`
--
ALTER TABLE `HISTORIQUE`
  ADD PRIMARY KEY (`login`,`idevent`),
  ADD KEY `idevent` (`idevent`);

--
-- Index pour la table `MESSAGE`
--
ALTER TABLE `MESSAGE`
  ADD PRIMARY KEY (`idmessage`),
  ADD KEY `sender` (`sender`),
  ADD KEY `reciver` (`reciver`);

--
-- Index pour la table `PROFILE`
--
ALTER TABLE `PROFILE`
  ADD PRIMARY KEY (`idprofile`),
  ADD KEY `login` (`login`);

--
-- Index pour la table `SUPPORT`
--
ALTER TABLE `SUPPORT`
  ADD PRIMARY KEY (`idsupport`);

--
-- Index pour la table `UTILISE_SUPPORT`
--
ALTER TABLE `UTILISE_SUPPORT`
  ADD PRIMARY KEY (`idsupport`,`login`),
  ADD KEY `login` (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `EVENEMENT`
--
ALTER TABLE `EVENEMENT`
  MODIFY `idevent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `MESSAGE`
--
ALTER TABLE `MESSAGE`
  MODIFY `idmessage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `PROFILE`
--
ALTER TABLE `PROFILE`
  MODIFY `idprofile` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `SUPPORT`
--
ALTER TABLE `SUPPORT`
  MODIFY `idsupport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `HISTORIQUE`
--
ALTER TABLE `HISTORIQUE`
  ADD CONSTRAINT `HISTORIQUE_ibfk_1` FOREIGN KEY (`login`) REFERENCES `COMPTE` (`login`),
  ADD CONSTRAINT `HISTORIQUE_ibfk_2` FOREIGN KEY (`idevent`) REFERENCES `EVENEMENT` (`idevent`);

--
-- Contraintes pour la table `MESSAGE`
--
ALTER TABLE `MESSAGE`
  ADD CONSTRAINT `MESSAGE_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `COMPTE` (`login`),
  ADD CONSTRAINT `MESSAGE_ibfk_2` FOREIGN KEY (`reciver`) REFERENCES `COMPTE` (`login`);

--
-- Contraintes pour la table `PROFILE`
--
ALTER TABLE `PROFILE`
  ADD CONSTRAINT `PROFILE_ibfk_1` FOREIGN KEY (`login`) REFERENCES `COMPTE` (`login`);

--
-- Contraintes pour la table `UTILISE_SUPPORT`
--
ALTER TABLE `UTILISE_SUPPORT`
  ADD CONSTRAINT `UTILISE_SUPPORT_ibfk_1` FOREIGN KEY (`idsupport`) REFERENCES `SUPPORT` (`idsupport`),
  ADD CONSTRAINT `UTILISE_SUPPORT_ibfk_2` FOREIGN KEY (`login`) REFERENCES `COMPTE` (`login`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
