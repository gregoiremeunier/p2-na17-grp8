/*
		Groupe 8 - NA17 A18 - Projet 2

Membres du groupe 8 :
SUN Jian
HEYMAN Pierrick
EL BLIDI Yasmine
MEUNIER Grégoire

SQL CREATE/INSERT : BDD Relationnel

*/

-- Création des tables :

CREATE TABLE membre (
  login VARCHAR(25) PRIMARY KEY,
  hash_mdp VARCHAR(100) NOT NULL,
  nom VARCHAR(20) NOT NULL,
  prenom VARCHAR(20) NOT NULL,
  numero NUMERIC(4) NOT NULL,
  rue VARCHAR(25) NOT NULL,
  codepostal NUMERIC(5) NOT NULL,
  ville VARCHAR(25) NOT NULL,
  pays VARCHAR(25) NOT NULL,
  date_naissance DATE NOT NULL,
  date_inscription DATE NOT NULL,
  date_derniere_connexion DATE NOT NULL
  -- CHECK (date_inscription > NOW)
);

CREATE TABLE administrateur (
  login VARCHAR(25) PRIMARY KEY,
  super_admin NUMERIC(1),
  FOREIGN KEY (login) REFERENCES membre(login),
  CHECK (super_admin BETWEEN 0 AND 1)
);

CREATE TABLE vendeur (
  login VARCHAR(25) PRIMARY KEY,
  iban VARCHAR(20) NOT NULL,
  FOREIGN KEY (login) REFERENCES membre(login),
  CHECK (LENGTH(iban) = 20)
);

CREATE TABLE acheteur (
  login VARCHAR(25) PRIMARY KEY,
  point_fidelite NUMERIC(4) NOT NULL,
  numero_cb VARCHAR(16) NOT NULL,
  FOREIGN KEY (login) REFERENCES membre(login),
  CHECK (LENGTH(numero_cb) = 16)
);

CREATE TABLE email (
  login VARCHAR(25) PRIMARY KEY,
  email VARCHAR(30) NOT NULL UNIQUE,
  FOREIGN KEY (login) REFERENCES membre(login),
  CHECK (email LIKE '%@%')
);

CREATE TABLE telephone (
  login VARCHAR(25) PRIMARY KEY,
  num_tel VARCHAR(10) NOT NULL UNIQUE,
  FOREIGN KEY (login) REFERENCES vendeur(login),
  CHECK (LENGTH(num_tel) = 10)
);

CREATE TABLE panier (
  num_panier INTEGER PRIMARY KEY,
  paye NUMERIC(1) NOT NULL,
  acheteur VARCHAR(25) NOT NULL,
  FOREIGN KEY (acheteur) REFERENCES acheteur(login),
  CHECK (paye BETWEEN 0 AND 1)
);

CREATE TABLE produit (
  reference VARCHAR(25) PRIMARY KEY,
  prix FLOAT(10) NOT NULL,
  lieu_fabrication VARCHAR(50) NOT NULL,
  stock INTEGER NOT NULL,
  vendeur VARCHAR(25) NOT NULL,
  FOREIGN KEY (vendeur) REFERENCES vendeur(login)
);

CREATE TABLE contient (
  panier INTEGER NOT NULL,
  produit VARCHAR(25) NOT NULL,
  quantite INTEGER,
  PRIMARY KEY (panier, produit),
  FOREIGN KEY (panier) REFERENCES panier(num_panier),
  FOREIGN KEY (produit) REFERENCES produit(reference),
  CHECK (quantite > 0)
);

  /* attributs utilisés uniquement dans le MongoDB et le NEO4J
  description VARCHAR(50) NOT NULL,
  occasion NUMERIC(1) NOT NULL,
  date_ajout DATE NOT NULL,
  produitVedette NUMERIC(1) NOT NULL,
  date_fin DATE,
  importance NUMERIC(1),
  nommePar VARCHAR(25),
  FOREIGN KEY (nommePar) REFERENCES administrateur(login),
  CHECK (occasion BETWEEN 0 AND 1),
  CHECK (produitVedette BETWEEN 0 AND 1),
  CHECK (importance BETWEEN 0 AND 4),
  CHECK ((produitVedette = 0 AND date_fin IS NULL AND importance IS NULL AND nommePar IS NULL) OR (produitVedette = 1 AND date_fin IS NOT NULL and importance IS NOT NULL AND nommePar IS NOT NULL))
  */

/* Ramené dans la bdd NEO4J
CREATE TABLE categorie (
  nom VARCHAR(10) PRIMARY KEY,
  description VARCHAR(50) NOT NULL,
  date_creation DATE NOT NULL,
  creePar VARCHAR(25) NOT NULL,
  FOREIGN KEY (creePar) REFERENCES administrateur(login)
);
*/

/*utilisée dans le neo4j
CREATE TABLE article (
  intitule VARCHAR(25) PRIMARY KEY,
  contenu VARCHAR(200) NOT NULL,
  auteur VARCHAR(10) NOT NULL,
  date_publication DATE NOT NULL,
  article_promotion NUMERIC(1) NOT NULL,
  misEnLignePar VARCHAR(25) NOT NULL,
  FOREIGN KEY (misEnLignePar) REFERENCES administrateur(login),
  CHECK (article_promotion BETWEEN 0 AND 1)
);
*/

/*utilisé dans le MongoDB
CREATE TABLE avis (
  idAvis INTEGER PRIMARY KEY,
  note NUMERIC(1),
  description VARCHAR(100) NOT NULL,
  date_evaluation DATE NOT NULL,
  redigePar VARCHAR(25) NOT NULL,
  evalue VARCHAR(25) NOT NULL,
  FOREIGN KEY (redigePar) REFERENCES acheteur(login),
  FOREIGN KEY (evalue) REFERENCES produit(reference),
  CHECK (note BETWEEN 0 AND 5)
);
*/

/*utilisées dans le neo4j
CREATE TABLE appartient (
  categorie VARCHAR(10) NOT NULL,
  produit VARCHAR(25) NOT NULL,
  PRIMARY KEY (categorie, produit),
  FOREIGN KEY (categorie) REFERENCES categorie(nom),
  FOREIGN KEY (produit) REFERENCES produit(reference)
);


CREATE TABLE promouvoit (
  article VARCHAR(25) NOT NULL,
  produit VARCHAR(25) NOT NULL,
  PRIMARY KEY (article, produit),
  FOREIGN KEY (article) REFERENCES article(intitule),
  FOREIGN KEY (produit) REFERENCES produit(reference)
);
*/


-- CrÃ©ation des administrateurs
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays, date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('a000001','F4jtN4k4', 'Dupont', 'Thomas', 12, 'Rue de l''arsenal', 17300, 'Rochefort', 'FRANCE', '1990-12-24', '2018-11-15', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays, date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('a000002', 'zV46y9Vu', 'Dubois', 'Lila', 34, 'Rue de Tolbiac', 75013, 'Paris', 'FRANCE', '1993-10-14', '2018-11-15', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays, date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('a000003', 'ZzrS553p', 'Barbier', 'Marcel', 3, 'Rue de Fessenheim', 67000, 'Strasbourg', 'FRANCE', '1994-08-14', '2018-11-15', NOW());
INSERT INTO administrateur (login, super_admin) VALUES ('a000001', 0);
INSERT INTO administrateur (login, super_admin) VALUES ('a000002', 1);
INSERT INTO administrateur (login, super_admin) VALUES ('a000003', 0);

-- CrÃ©ation des vendeurs
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('v000001', '6gji3NE8', 'Bertrand', 'Vincent',15, 'Chemin des Ecoliers', 38000,'Grenoble', 'FRANCE', '1985-09-03', '2018-11-17', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('v000002', 'k25unDT6', 'Lefebvre', 'VÃ©ronique', 4, 'Rue Edouard Manet', 59000, 'Lille', 'FRANCE', '1990-02-13', '2018-11-29', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('v000003', 'jePq7U57', 'Boulanger', 'Marc', 12, 'Rue des Petites Rues', 44300, 'Nantes', 'FRANCE', '1987-10-28', '2018-12-27', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('v000004', 'BAj58ah4', 'Perrot', 'Maxime', 9, 'Rue des EntrepÃ´ts', 69000, 'Lyon', 'FRANCE', '1980-06-25', '2018-12-08', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('v000005', 'PqP76su7', 'Dufour', 'Roger', 6, 'Rue FÃ©nÃ©lon', 31200, 'Toulouse', 'FRANCE', '1991-05-13', '2019-01-24', NOW());
INSERT INTO vendeur (login, iban) VALUES ('v000001', 'FR113000200333560024');
INSERT INTO vendeur (login, iban) VALUES ('v000002', 'FR178000200433780022');
INSERT INTO vendeur (login, iban) VALUES ('v000003', 'FR169450700378760024');
INSERT INTO vendeur (login, iban) VALUES ('v000004', 'FR714000500323560024');
INSERT INTO vendeur (login, iban) VALUES ('v000005', 'FR153000400973560024');

-- CrÃ©ation des acheteurs
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('ac000001', 'd7Bj55Dw', 'Bonnet', 'AurÃ©lien', 13, 'Rue Erevan', 06002, 'Nice', 'FRANCE', '2000-01-15', '2018-11-30', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('ac000002', '2urCK37x', 'Muler', 'Maelis', 1, 'Rue  Goursat', 87280, 'Limoges', 'FRANCE', '1992-09-17', '2018-12-05', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('ac000003', 'Ca6kLq72', 'Celeste', 'Pierre', 35, 'Rue des Fenals', 13010, 'Marseille', 'FRANCE', '1997-05-13', '2018-12-23', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('ac000004', 'wn5WE92w', 'Monette', 'Julien', 4, 'Rue  Dolet', 69000, 'Lyon', 'FRANCE', '1996-10-13', '2018-12-25', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('ac000005', '2Zy7nzK8', 'Beuzelin', 'Richard', 7, 'Rue  Rostand', 80090, 'Amiens', 'FRANCE', '1995-11-04', '2018-12-29', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('ac000006', '47Nek3Bf', 'Souttin', 'Alban', 12, 'Rue de la poule', 29200, 'Brest', 'FRANCE', '1998-04-16', '2018-12-31', NOW());
INSERT INTO membre (login, hash_mdp, nom, prenom, numero, rue, codepostal, ville, pays,  date_naissance, date_inscription, date_derniere_connexion)
    VALUES ('ac000007', '3t4Vr7Ja', 'Besson', 'Jeannine', 9, 'Rue de PÃ©rigueux', 75019, 'Paris', 'FRANCE', '1996-10-14', '2018-12-14', NOW());
INSERT INTO acheteur (login, point_fidelite , numero_cb) VALUES ('ac000001', 0, '1234567891234567');
INSERT INTO acheteur (login, point_fidelite , numero_cb) VALUES ('ac000002', 0, '2345678912345678');
INSERT INTO acheteur (login, point_fidelite , numero_cb) VALUES ('ac000003', 0, '3456789123456789');
INSERT INTO acheteur (login, point_fidelite , numero_cb) VALUES ('ac000004', 0, '1234567891234560');
INSERT INTO acheteur (login, point_fidelite , numero_cb) VALUES ('ac000005', 0, '4567891234567891');
INSERT INTO acheteur (login, point_fidelite , numero_cb) VALUES ('ac000006', 0, '5678912345678912');
INSERT INTO acheteur (login, point_fidelite , numero_cb) VALUES ('ac000007', 0, '6789123456789123');

-- Insertion email
INSERT INTO email (login, email) VALUES ('a000001', 'a000001@orange.fr');
INSERT INTO email (login, email) VALUES ('a000002', 'a000002@bouygues.fr');
INSERT INTO email (login, email) VALUES ('a000003', 'a000003@orange.fr');
INSERT INTO email (login, email) VALUES ('v000001', 'v000001@orange.fr');
INSERT INTO email (login, email) VALUES ('v000002', 'v000002@utc.fr');
INSERT INTO email (login, email) VALUES ('v000003', 'v000003@hei.fr');
INSERT INTO email (login, email) VALUES ('v000004', 'v000004@sfr.fr');
INSERT INTO email (login, email) VALUES ('v000005', 'v000005@insa.fr');
INSERT INTO email (login, email) VALUES ('ac000001', 'ac000001@free.fr');
INSERT INTO email (login, email) VALUES ('ac000002', 'ac000002@utc.fr');
INSERT INTO email (login, email) VALUES ('ac000003', 'ac000003@wanadoo.fr');
INSERT INTO email (login, email) VALUES ('ac000004', 'ac000004@outloo.fr');
INSERT INTO email (login, email) VALUES ('ac000005', 'ac000005@hotmail.fr');
INSERT INTO email (login, email) VALUES ('ac000006', 'ac000006@sfr.fr');

-- Insertion telephone
INSERT INTO telephone (login, num_tel) VALUES ('v000001', '0123456789');
INSERT INTO telephone (login, num_tel) VALUES ('v000002', '0123456783');
INSERT INTO telephone (login, num_tel) VALUES ('v000003', '0123456785');
INSERT INTO telephone (login, num_tel) VALUES ('v000004', '0123456787');
INSERT INTO telephone (login, num_tel) VALUES ('v000005', '0123456782');

-- Insertion categorie
/* utilisés dans le neo4j
INSERT INTO categorie (nom, description, date_creation, creePar) VALUES ('High-Tech', 'Nouvelles Technologies', '2017-08-02', 'a000001');
INSERT INTO categorie (nom, description, date_creation, creePar) VALUES ('Bricolage', 'Tout pour la maison', '2017-08-04', 'a000001');
INSERT INTO categorie (nom, description, date_creation, creePar) VALUES ('Cuisine', 'Pour manger', '2017-08-22', 'a000001');
INSERT INTO categorie (nom, description, date_creation, creePar) VALUES ('Mobilier', 'Pour meubler', '2017-09-02', 'a000002');
INSERT INTO categorie (nom, description, date_creation, creePar) VALUES ('DÃ©coration', 'Faire beau', '2018-08-02', 'a000002');
INSERT INTO categorie (nom, description, date_creation, creePar) VALUES ('VÃ©lo', 'Tout roule', '2017-11-12', 'a000002');
*/

-- Insertion produit
/* utilisés dans le mongoDB
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('ordi1', 'super ordinateur', 0, 500, '2017-02-02', 'Munich', 2, 'v000001', 0, NULL, NULL, NULL);
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('ordi2', 'ordinateur pas top', 0, 50, '2017-12-02', 'PÃ©kin', 5, 'v000001', 0, NULL, NULL, NULL);
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('marteau1', 'efficace', 1, 5, '2018-02-02', 'Paris', 10, 'v000002', 0, NULL, NULL, NULL);
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('morceaux_bois', 'robuste', 1, 1.5, '2016-05-02', 'Lille', 2, 'v000002', 0, NULL, NULL, NULL);
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('evier02', 'en aluminium', 0, 150, '2015-05-02', 'Berlin', 12, 'v000003', 1, '2018-12-12', 3, 'a000001');
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('evier03', 'en Ã©tain', 1, 250, '2015-05-02', 'Rome', 102, 'v000003', 0, NULL, NULL, NULL);
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('frigo02', 'trÃ¨s froid', 1, 350, '2015-09-02', 'Helsini', 12, 'v000004', 1, '2019-01-01', 2, 'a000003');
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('enceinte3', 'music is life', 1, 550, '2017-05-02', 'Brest', 120, 'v000004', 1, '2018-12-25', 1, 'a000003');
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
              VALUES ('fourchette', 'manger !!', 0, 0.5, '2011-05-02', 'New-York', 1120, 'v000004', 0, NULL, NULL, NULL);
INSERT INTO produit (reference, description, occasion, prix, date_ajout, lieu_fabrication, stock, vendeur, produitVedette, date_fin, importance, nommePar)
			  VALUES ('vase', 'Vive les fleurs', 0, 10, '2011-04-12', 'New-York', 1120, 'v000004',1, '2018-12-25', 1, 'a000003');
*/

-- Insertion panier
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('001', 1, 'ac000001');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('002', 1, 'ac000001');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('003', 0, 'ac000001');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('004', 1, 'ac000002');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('005', 1, 'ac000002');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('006', 0, 'ac000002');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('007', 1, 'ac000003');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('008', 0, 'ac000003');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('009', 0, 'ac000004');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('010', 0, 'ac000005');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('011', 0, 'ac000006');
INSERT INTO panier (num_panier, paye, acheteur) VALUES ('012', 0, 'ac000007');

-- Insertion contient
INSERT INTO contient (panier, produit, quantite) VALUES ('001', 'ordi1', 2);
INSERT INTO contient (panier, produit, quantite) VALUES ('001', 'ordi2', 1);
INSERT INTO contient (panier, produit, quantite) VALUES ('002', 'evier02', 10);
INSERT INTO contient (panier, produit, quantite) VALUES ('002', 'fourchette', 15);
INSERT INTO contient (panier, produit, quantite) VALUES ('004', 'ordi2', 15);
INSERT INTO contient (panier, produit, quantite) VALUES ('005', 'morceaux_bois', 25);
INSERT INTO contient (panier, produit, quantite) VALUES ('005', 'marteau1', 10);
INSERT INTO contient (panier, produit, quantite) VALUES ('007', 'frigo02', 2);
INSERT INTO contient (panier, produit, quantite) VALUES ('007', 'enceinte3', 9);
INSERT INTO contient (panier, produit, quantite) VALUES ('007', 'morceaux_bois', 30);
INSERT INTO contient (panier, produit, quantite) VALUES ('008', 'ordi1', 2);
INSERT INTO contient (panier, produit, quantite) VALUES ('0010', 'fourchette', 3);

-- Insertion appartient
/* utilisés dans le neo4j
INSERT INTO appartient (categorie, produit) VALUES ('High-Tech', 'ordi1');
INSERT INTO appartient (categorie, produit) VALUES ('High-Tech', 'ordi2');
INSERT INTO appartient (categorie, produit) VALUES ('Bricolage', 'marteau1');
INSERT INTO appartient (categorie, produit) VALUES ('Bricolage', 'morceaux_bois');
INSERT INTO appartient (categorie, produit) VALUES ('DÃ©coration', 'morceaux_bois');
INSERT INTO appartient (categorie, produit) VALUES ('Cuisine', 'evier02');
INSERT INTO appartient (categorie, produit) VALUES ('Mobilier', 'evier02');
INSERT INTO appartient (categorie, produit) VALUES ('Cuisine', 'evier03');
INSERT INTO appartient (categorie, produit) VALUES ('Mobilier', 'evier03');
INSERT INTO appartient (categorie, produit) VALUES ('Cuisine', 'frigo02');
INSERT INTO appartient (categorie, produit) VALUES ('High-Tech', 'enceinte3');
INSERT INTO appartient (categorie, produit) VALUES ('DÃ©coration', 'enceinte3');
INSERT INTO appartient (categorie, produit) VALUES ('Cuisine', 'fourchette');
INSERT INTO appartient (categorie, produit) VALUES ('DÃ©coration', 'vase');
*/


-- Insertion article
/* utilisés dans le neo4j
INSERT INTO article (intitule, contenu, auteur, date_publication, article_promotion, misEnLignePar)
    VALUES ('Promo enceintes','DÃ©stockage massif de nos enceintes pour le nouvel an !', 'Bose', '2017-12-24', 1, 'a000001');
INSERT INTO article (intitule, contenu, auteur, date_publication, article_promotion, misEnLignePar)
    VALUES ('Maintenance', 'Le site sera en maintenance demain', 'OVH', '2018-11-14', 0, 'a000002');
INSERT INTO article (intitule, contenu, auteur, date_publication, article_promotion, misEnLignePar)
    VALUES ('Canicule', 'Achetez un de nos frigos en cette pÃ©riode de canicule !', 'Frigo&Cpg', '2018-07-14', 1, 'a000001');
INSERT INTO article (intitule, contenu, auteur, date_publication, article_promotion, misEnLignePar)
    VALUES ('Rabais Ã©viers', 'GrÃ¢ce Ã  un surplus de production, profitez d''une rÃ©duc sur les Ã©viers !', 'Jacob', '2018-10-21', 1, 'a000003');
INSERT INTO article (intitule, contenu, auteur, date_publication, article_promotion, misEnLignePar)
    VALUES ('Candidature acteur','Nous recherchons des acteurs amateurs sur Paris !', 'Gaumont', '2018-11-01', 0,'a000002');
*/

-- Insertion promouvoit
/* utilisés dans le neo4j
INSERT INTO promouvoit (article, produit) VALUES ('Promo enceintes', 'enceinte3');
INSERT INTO promouvoit (article, produit) VALUES ('Canicule' , 'frigo02');
INSERT INTO promouvoit (article, produit) VALUES ('Rabais Ã©viers', 'evier02');
*/

-- Insertion avis
/* utilisés dans le mongoDB
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (1, 5, 'Excellent produit', '2018-01-13', 'ac000001', 'ordi1');
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (2, 3, 'Produit moyen', '2017-02-15', 'ac000001', 'ordi2');
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (3, 4, 'bon produit', '2016-03-15', 'ac000002', 'ordi1');
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (4, 2, 'mauvais produit', '2015-04-14', 'ac000003', 'ordi2');
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (5, 2, 'mauvais produit', '2014-05-13', 'ac000004', 'ordi1');
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (6, 1, 'tres mauvais produit', '2013-06-12', 'ac000004', 'evier02');
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (7, 5, 'Excellent produit', '2012-07-12', 'ac000004', 'morceaux_bois');
INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
    VALUES (8, 5, 'Excellent produit', '2011-08-11', 'ac000005', 'marteau1');
*/
