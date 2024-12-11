-- REQUETES EXERCICE "CINEMA"

-- a. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 
SELECT 
    film.id_film, 
    film.titre, 
    film.sortie, 
    TIME_FORMAT(SEC_TO_TIME(film.duree * 60), '%H:%i') AS duree,
    CONCAT(personne.prenom, ' ', personne.nom) AS realisateur
FROM film
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne ON realisateur.id_personne = personne.id_personne
WHERE id_film = 1;


-- b. Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)
SELECT 
    film.id_film, 
    film.titre, 
    film.sortie, 
    TIME_FORMAT(SEC_TO_TIME(film.duree * 60), '%H:%i') AS duree,
    CONCAT(personne.prenom, ' ', personne.nom) AS realisateur
FROM film
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne ON realisateur.id_personne = personne.id_personne
WHERE film.duree > 135
ORDER BY film.duree DESC;


-- c. Liste des films d’un réalisateur (en précisant l’année de sortie) 
SELECT 
    film.id_film, 
    film.titre, 
    film.sortie,
    CONCAT(personne.prenom, ' ', personne.nom) AS realisateur
FROM film
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne ON realisateur.id_personne = personne.id_personne
WHERE realisateur.id_realisateur = 4;


-- d. Nombre de films par genre (classés dans l’ordre décroissant)
SELECT genre.nom_genre,
COUNT(film_genre.id_genre) AS nombre_de_films
FROM genre
INNER JOIN film_genre ON genre.id_genre = film_genre.id_genre
GROUP BY genre.nom_genre
ORDER BY nombre_de_films DESC;


-- e. Nombre de films par réalisateur (classés dans l’ordre décroissant)
SELECT
    CONCAT(personne.prenom, ' ', personne.nom) AS realisateur,
    COUNT(film.id_film) AS nombre_de_films
FROM film
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne ON realisateur.id_personne = personne.id_personne
GROUP BY realisateur
ORDER BY nombre_de_films DESC;


-- f. Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe
SELECT
    film.titre AS titre_film,
    CONCAT(personne.prenom, " ", personne.nom, " ", personne.sexe) AS casting_film
FROM casting
INNER JOIN film ON casting.id_film = film.id_film
INNER JOIN acteur ON casting.id_acteur = acteur.id_acteur
INNER JOIN personne ON acteur.id_personne = personne.id_personne
WHERE film.id_film = 9;


-- g. Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de 
-- sortie (du film le plus récent au plus ancien)
SELECT f.titre, f.sortie, c.id_role
FROM film f
JOIN casting c ON f.id_film = c.id_film
WHERE id_acteur = 4
ORDER BY f.sortie DESC;


-- h. Liste des personnes qui sont à la fois acteurs et réalisateurs
SELECT personne.id_personne, prenom, nom
FROM personne
INNER JOIN acteur
ON personne.id_personne = acteur.id_personne
INNER JOIN realisateur
ON personne.id_personne = realisateur.id_personne;


-- i. Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)
SELECT film.id_film, film.titre, film.sortie
FROM film
WHERE film.sortie >= DATE_SUB(CURRENT_DATE, INTERVAL 15 YEAR)   -- films datant de moins de 15 ans pour adapter à ma BDD
ORDER BY film.sortie DESC;

-- j. Nombre d’hommes et de femmes parmi les acteurs

SELECT
    COUNT(id_acteur * sexe = "F") AS nbre_actrices,
    COUNT(id_acteur * sexe = "H") AS nbre_acteurs
FROM acteur
INNER JOIN personne ON acteur.id_personne = personne.id_personne
GROUP BY personne.sexe;


-- k. Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)

SELECT
    id_personne,
    CONCAT(prenom, " ", nom) AS identite, naissance,
    (YEAR(CURRENT_DATE) - naissance) AS age
FROM personne
WHERE (YEAR(CURRENT_DATE) - naissance) > 50
ORDER BY naissance DESC;

--

SELECT
    id_personne,
    CONCAT(prenom, " ", nom) AS identite, naissance,
    (YEAR(CURRENT_DATE) - naissance) AS age
FROM personne
WHERE (YEAR(CURRENT_DATE) - naissance) >= 50
ORDER BY naissance DESC;

-- l. Acteurs ayant joué dans 3 films ou plus

SELECT
    personne.id_personne,
    CONCAT(personne.prenom, " ", personne.nom) AS identite,
    COUNT(casting.id_film) AS total_film
FROM casting
INNER JOIN acteur ON casting.id_acteur = acteur.id_acteur
INNER JOIN personne ON acteur.id_personne = personne.id_personne
GROUP BY identite
HAVING total_film >= 3;


