-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 19 mars 2024 à 15:30
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `GStockB`
--

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_co` int(11) NOT NULL,
  `date_co` datetime NOT NULL,
  `statut_co` enum('en_attente','validee','invalidée') DEFAULT 'en_attente',
  `type_co` enum('entrée','sortie') DEFAULT NULL,
  `id_u` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id_co` int(11) NOT NULL,
  `id_st` int(11) NOT NULL,
  `quantite_details` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `nom_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id_role`, `nom_role`) VALUES
(1, 'super-admin'),
(2, 'admin'),
(3, 'user');

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

CREATE TABLE `stocks` (
  `id_st` int(11) NOT NULL,
  `nom_st` varchar(255) NOT NULL,
  `description_st` varchar(255) NOT NULL,
  `quantite_st` int(11) NOT NULL,
  `type_st` enum('medicament','materiel','autre') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stocks`
--

INSERT INTO `stocks` (`id_st`, `nom_st`, `description_st`, `quantite_st`, `type_st`) VALUES
(6, 'Doliprane', 'Utilisé pour le traitement des douleurs, fièvre, allergies, symptômes du rhume ou état grippal', 1738, 'medicament'),
(9, 'Aspirine', 'Acide acétylsalicylique, remède contre la douleur et la fièvre.', 0, 'medicament'),
(24, 'Efferalgan', 'Traitement symptomatique des douleurs d&#039;intensité légère à modérée et/ou des états fébriles.', 930, 'medicament'),
(25, 'Dafalgan', 'Traitement symptomatique des douleurs légères à modérées et de la fièvre.', 590, 'medicament'),
(26, 'Imodium', 'Traitement symptomatique des diarrhées aiguës et chroniques.', 840, 'medicament'),
(27, 'Spasfon', 'Traitement symptomatique des douleurs liées aux troubles fonctionnels du tube digestif et des voies biliaires.', 400, 'medicament'),
(28, 'Daflon', 'Traitement des symptômes en rapport avec l&#039;insuffisance veinolymphatique (jambes lourdes, douleurs, impatiences du primo-décubitus),', 380, 'medicament'),
(29, 'Gaviscon', 'Traitement symptomatique du reflux gastro-oesophagien.', 400, 'medicament'),
(30, 'Toplexil', 'Traitement symptomatique des toux non productives gênantes en particulier à prédominance nocturne.', 250, 'medicament'),
(31, 'Xanax', 'Traitement symptomatique des manifestations anxieuses sévères et/ou invalidantes,', 900, 'medicament'),
(32, 'Pansements', 'Dispositif de protection permettant de recouvrir une plaie située sur la peau.', 680, 'materiel'),
(33, 'Orthèse', 'Appareillage qui compense une fonction absente ou déficitaire, assiste une structure articulaire ou musculaire, stabilise un segment corporel pendant une phase de réadaptation ou de repos.', 700, 'materiel'),
(34, 'Masques', 'Protection respiratoire à usage unique conçu pour limiter la propagation vers l&#039;environnement très proche des germes', 200, 'materiel');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_u` int(11) NOT NULL,
  `nom_u` varchar(255) NOT NULL,
  `prenom_u` varchar(255) NOT NULL,
  `email_u` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_u`, `nom_u`, `prenom_u`, `email_u`, `mot_de_passe`, `active`, `id_role`) VALUES
(10, 'Super', 'Administrateur', 'super@administrateur', '$2y$10$HVai0BVakznmRURzoaBtVeimTJ7/sRHSEQQIGppn09UkEA8sru2Ee', 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_co`),
  ADD KEY `commandes_utilisateurs_FK` (`id_u`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id_co`,`id_st`),
  ADD KEY `details_commande_stocks_FK` (`id_st`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id_st`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_u`),
  ADD KEY `utilisateur_roles_FK` (`id_role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id_co` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id_st` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_utilisateurs_FK` FOREIGN KEY (`id_u`) REFERENCES `utilisateurs` (`id_u`);

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `details_commande_commandes_FK` FOREIGN KEY (`id_co`) REFERENCES `commandes` (`id_co`),
  ADD CONSTRAINT `details_commande_stocks_FK` FOREIGN KEY (`id_st`) REFERENCES `stocks` (`id_st`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateur_roles_FK` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
