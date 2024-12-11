-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema_ledlev
CREATE DATABASE IF NOT EXISTS `cinema_ledlev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema_ledlev`;

-- Listage de la structure de table cinema_ledlev. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_acteur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `acteur_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.acteur : ~6 rows (environ)
INSERT INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 21),
	(23, 23),
	(24, 24),
	(25, 25),
	(26, 26),
	(27, 27),
	(28, 28),
	(29, 29),
	(30, 30),
	(31, 31);

-- Listage de la structure de table cinema_ledlev. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_film` int NOT NULL,
  `id_acteur` int NOT NULL,
  `id_role` int NOT NULL,
  KEY `id_acteur` (`id_acteur`),
  KEY `id_role` (`id_role`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `casting_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE,
  CONSTRAINT `casting_ibfk_2` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`) ON DELETE CASCADE,
  CONSTRAINT `casting_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.casting : ~35 rows (environ)
INSERT INTO `casting` (`id_film`, `id_acteur`, `id_role`) VALUES
	(1, 1, 1),
	(1, 2, 2),
	(1, 3, 3),
	(1, 4, 4),
	(1, 5, 5),
	(2, 3, 7),
	(2, 6, 6),
	(2, 7, 8),
	(2, 8, 9),
	(3, 4, 10),
	(3, 9, 11),
	(3, 10, 12),
	(4, 12, 13),
	(4, 13, 14),
	(4, 14, 15),
	(5, 15, 16),
	(5, 16, 17),
	(6, 16, 20),
	(6, 17, 18),
	(6, 18, 19),
	(7, 4, 22),
	(7, 20, 21),
	(7, 21, 23),
	(8, 23, 21),
	(8, 24, 24),
	(8, 25, 25),
	(9, 25, 30),
	(9, 26, 26),
	(9, 27, 27),
	(9, 28, 28),
	(9, 29, 29),
	(10, 23, 31),
	(10, 25, 34),
	(10, 30, 32),
	(10, 31, 33);

-- Listage de la structure de table cinema_ledlev. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sortie` year NOT NULL,
  `duree` int NOT NULL,
  `synopsis` text COLLATE utf8mb4_bin,
  `note` decimal(3,1) NOT NULL,
  `id_realisateur` int NOT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.film : ~10 rows (environ)
INSERT INTO `film` (`id_film`, `titre`, `sortie`, `duree`, `synopsis`, `note`, `id_realisateur`) VALUES
	(1, 'Pulp Fiction', '1994', 154, '"Pulp Fiction" tisse plusieurs histoires entrecroisées dans le monde du crime de Los Angeles. Le film suit Vincent Vega et Jules Winnfield, deux tueurs à gages, leur patron Marsellus Wallace et sa femme Mia, ainsi que Butch Coolidge, un boxeur vieillissant. À travers une série de événements imprévus et de dialogues emblématiques, les destins de ces personnages se croisent de manière inattendue.', 4.5, 1),
	(2, 'Jackie Brown', '1998', 154, 'Jackie Brown est une hôtesse de l\'air prise entre la police et un trafiquant d\'armes, Ordell Robbie. Pour éviter la prison, elle élabore un plan pour doubler les deux parties et s\'en sortir avec une grosse somme d\'argent. Ce film est une adaptation du roman "Rum Punch" d\'Elmore Leonard, et met en scène une série de personnages hauts en couleur, chacun cherchant à tirer son épingle du jeu.', 4.0, 1),
	(3, 'Kill Bill 1', '2003', 111, '"Kill Bill: Volume 1" raconte l\'histoire de La Mariée, une ancienne tueuse à gages qui, après avoir été trahie et laissée pour morte le jour de son mariage, se réveille d\'un coma de quatre ans. Décidée à se venger, elle entreprend de traquer et d\'éliminer ses anciens complices, un par un. Le film est un hommage aux films de kung-fu et aux westerns spaghetti, avec des scènes d\'action stylisées et une narration non linéaire.', 4.3, 1),
	(4, 'Babylon', '2023', 189, '"Babylon" est un film épique se déroulant dans le Hollywood des années 1920, une époque de décadence et de transformation pour l\'industrie cinématographique. Le film suit plusieurs personnages ambitieux et leurs parcours tumultueux alors que le cinéma transitionne du muet au parlant. Parmi eux, Jack Conrad, une star du cinéma muet, Nellie LaRoy, une actrice montante et excentrique, et Manny Torres, un assistant de production déterminé à réussir. Le film explore les excès, les scandales et les rêves brisés de cette période faste.', 4.0, 2),
	(5, 'Whiplash', '2014', 106, '"Whiplash" suit l\'histoire d\'Andrew Neiman, un jeune batteur de jazz ambitieux, qui rejoint l\'une des meilleures écoles de musique des États-Unis. Il est rapidement confronté à Terence Fletcher, un chef d\'orchestre exigeant et tyrannique. Fletcher pousse Andrew à ses limites physiques et psychologiques dans le but de faire de lui un grand musicien, mais cette relation tendue se transforme en un véritable combat. Le film explore la quête de la perfection, l\'obsession et les sacrifices personnels dans le monde de la musique, où l\'excellence exige des efforts extrêmes.', 4.7, 2),
	(6, 'La La Land', '2016', 128, '"La La Land" raconte l’histoire de Sebastian, un pianiste de jazz passionné, et de Mia, une actrice en herbe, qui se rencontrent à Los Angeles. Les deux jeunes talents tombent amoureux, mais leurs carrières respectives et leurs rêves personnels les poussent à faire face à des choix difficiles. Le film explore la quête de l\'amour et du succès dans un Los Angeles fantasmé, tout en offrant des numéros musicaux spectaculaires et des moments de danse empreints de nostalgie. La comédie musicale mélange des éléments de romance, de rêve et de réalité, tout en rendant hommage aux grands classiques d\'Hollywood.', 4.5, 2),
	(7, 'Batman & Robin', '1997', 125, 'Dans Batman & Robin, Batman (George Clooney) et son acolyte Robin (Chris O\'Donnell) affrontent deux ennemis puissants : le docteur Pamela Isley, alias Poison Ivy, une écologiste folle qui utilise des plantes toxiques pour commettre ses crimes, et Mr. Freeze (Arnold Schwarzenegger), un scientifique devenu criminel après avoir été accidentellement transformé en être capable de geler tout ce qu\'il touche. Ils doivent également protéger Gotham City tout en gérant des problèmes personnels, notamment le rôle de Batgirl, la nièce d\'Alfred, qui rejoint les rangs des justiciers. L’histoire tourne autour de la lutte pour stopper un complot visant à faire fondre la ville et de la dynamique complexe entre les héros et leurs ennemis.', 1.6, 3),
	(8, 'The Dark Knight', '2008', 152, 'The Dark Knight suit Bruce Wayne (Christian Bale), alias Batman, qui lutte contre le crime à Gotham City. Face à lui se dresse un nouvel ennemi, le Joker (Heath Ledger), un criminel psychopathe sans motivation apparente, qui cherche à plonger la ville dans le chaos. Le film explore la tension entre Batman, le système judiciaire et l\'anarchie que représente le Joker. La lutte morale et physique que mène Batman contre ce criminel marque l\'ascension de l\'alter ego Two-Face (Aaron Eckhart), un ancien procureur devenu vengeur. Le film est acclamé pour sa profondeur psychologique, ses performances d\'acteurs, et la vision sombre de Gotham.', 4.7, 4),
	(9, 'Interstellar', '2014', 169, 'Interstellar se déroule dans un futur proche où la Terre est en train de se dégrader en raison de catastrophes écologiques. Un groupe d\'astronautes, dirigé par Cooper (Matthew McConaughey), un ancien pilote de la NASA, est envoyé à travers un trou de ver afin de trouver une nouvelle planète habitable pour l\'humanité. Le film explore des thèmes complexes tels que la relativité, les voyages dans le temps et l\'amour transcendant les dimensions, tout en se concentrant sur la relation entre Cooper et sa fille Murph.', 4.5, 4),
	(10, 'The Prestige', '2006', 130, 'Le Prestige raconte l\'histoire de deux magiciens rivaux à la fin du 19e siècle, Robert Angier (Hugh Jackman) et Alfred Borden (Christian Bale), dont la compétition acharnée les pousse à se livrer à des pratiques extrêmes pour déjouer l\'autre. Leur guerre de magicien se concentre sur un numéro de téléportation apparemment impossible, "Le Prestige". Alors qu\'ils rivalisent pour créer le plus grand tour, leurs vies personnelles et professionnelles sont bouleversées par des sacrifices dévastateurs, des trahisons et des secrets. Le film explore des thèmes tels que la jalousie, l\'obsession et les limites de l\'esprit humain face à la recherche de la perfection.', 4.5, 4);

-- Listage de la structure de table cinema_ledlev. film_genre
CREATE TABLE IF NOT EXISTS `film_genre` (
  `id_film` int NOT NULL,
  `id_genre` int NOT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `film_genre_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE,
  CONSTRAINT `film_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.film_genre : ~27 rows (environ)
INSERT INTO `film_genre` (`id_film`, `id_genre`) VALUES
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 2),
	(2, 3),
	(2, 4),
	(3, 1),
	(3, 2),
	(4, 4),
	(4, 5),
	(4, 6),
	(5, 4),
	(5, 7),
	(6, 5),
	(6, 7),
	(6, 8),
	(7, 1),
	(7, 9),
	(7, 10),
	(8, 1),
	(8, 4),
	(8, 11),
	(9, 4),
	(9, 9),
	(10, 2),
	(10, 4),
	(10, 9);

-- Listage de la structure de table cinema_ledlev. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `nom_genre` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.genre : ~11 rows (environ)
INSERT INTO `genre` (`id_genre`, `nom_genre`) VALUES
	(1, 'Action'),
	(2, 'Thriller'),
	(3, 'Policier'),
	(4, 'Drame'),
	(5, 'Comedie'),
	(6, 'Historique'),
	(7, 'Musical'),
	(8, 'Romance'),
	(9, 'Science-Fiction'),
	(10, 'Aventure'),
	(11, 'Crime');

-- Listage de la structure de table cinema_ledlev. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sexe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `naissance` year NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.personne : ~0 rows (environ)
INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `sexe`, `naissance`) VALUES
	(1, 'Tarantino', 'Quentin', 'H', '1963'),
	(2, 'Travolta', 'John', 'H', '1954'),
	(3, 'Leroy Jackson', 'Samuel', 'H', '1948'),
	(4, 'Thurman', 'Uma', 'F', '1970'),
	(5, 'Willis', 'Bruce', 'H', '1955'),
	(6, 'Grier', 'Pam', 'F', '1949'),
	(7, 'Forster', 'Robert', 'H', '1941'),
	(8, 'De Niro', 'Robert', 'H', '1943'),
	(9, 'Liu', 'Lucy', 'F', '1968'),
	(10, 'Carradine', 'David', 'H', '1936'),
	(11, 'Chazelle', 'Damien', 'H', '1985'),
	(12, 'Pitt', 'Brad', 'H', '1963'),
	(13, 'Robbie', 'Margot', 'F', '1990'),
	(14, 'Calva', 'Diego', 'H', '1992'),
	(15, 'Teller', 'Miles', 'H', '1987'),
	(16, 'Simmons', 'J.K', 'H', '1955'),
	(17, 'Gosling', 'Ryan', 'H', '1980'),
	(18, 'Stone', 'Emma', 'F', '1988'),
	(19, 'Schumacher', 'Joel', 'H', '1939'),
	(20, 'Clooney', 'George', 'H', '1961'),
	(21, 'Schwarzenergger', 'Arnold', 'H', '1947'),
	(22, 'Nolan', 'Christopher ', 'H', '1970'),
	(23, 'Bale', 'Christian', 'H', '1974'),
	(24, 'Ledger', 'Heath', 'H', '1979'),
	(25, 'Caine', 'Michael', 'H', '1933'),
	(26, 'McConaughey', 'Matthew', 'H', '1969'),
	(27, 'Hathaway ', 'Anne', 'F', '1982'),
	(28, 'Chastain', 'Jessica', 'F', '1977'),
	(29, 'Damon', 'Matt', 'H', '1970'),
	(30, 'Jackman', 'Hugh', 'F', '1978'),
	(31, 'Johansson', 'Scarlett', 'F', '1984');

-- Listage de la structure de table cinema_ledlev. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `realisateur_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.realisateur : ~0 rows (environ)
INSERT INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 1),
	(2, 11),
	(3, 19),
	(4, 22);

-- Listage de la structure de table cinema_ledlev. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_ledlev.role : ~34 rows (environ)
INSERT INTO `role` (`id_role`, `nom_role`) VALUES
	(1, 'Jimmie Dimmick'),
	(2, 'Vincent Vega'),
	(3, 'Jules Winnfield'),
	(4, 'Mia Wallace'),
	(5, 'Butch Coolidge'),
	(6, 'Jackie Brown'),
	(7, 'Ordell Robbie'),
	(8, 'Max Cherry'),
	(9, 'Louis Gara'),
	(10, 'The Bride'),
	(11, 'O Ren Ishii'),
	(12, 'Bill (Kill Bill)'),
	(13, 'John Conrad'),
	(14, 'Nellie LaRoy'),
	(15, 'Manny Torres'),
	(16, 'Andrew Neiman'),
	(17, 'Terence Fletcher'),
	(18, 'Sebastian Wilder'),
	(19, 'Mia Dolan'),
	(20, 'Bill (La la land)'),
	(21, 'Batman'),
	(22, 'Poison Ivy'),
	(23, 'Mr. Freeze'),
	(24, 'Joker'),
	(25, 'Alfred Pennyworth'),
	(26, 'Cooper'),
	(27, 'Brand (fille)'),
	(28, 'Murphy'),
	(29, 'Dr. Mann'),
	(30, 'Professor Brand'),
	(31, 'Robert Angier'),
	(32, 'Alfred Borden'),
	(33, 'Olivia Wenscombe'),
	(34, 'Cutter');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
