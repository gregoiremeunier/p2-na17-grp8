/*
		Groupe 8 - NA17 A18 - Projet 2

Membres du groupe 8 :
SUN Jian
HEYMAN Pierrick
EL BLIDI Yasmine
MEUNIER Grégoire

SQL INSERT : Neo4j

*/
//Categories
CREATE (HighTech:Categorie{Name:'High-Tech',Description:'Nouvelles Technologies',datecreation:'2017-08-02'})
CREATE (Bricolage:Categorie{Name:'Bricolage',Description:'Tout pour la maison',datecreation:'2017-08-22'})
CREATE (Cuisine:Categorie{Name:'Cuisine',Description:'Pour manger',datecreation:'2017-09-12'})
CREATE (Mobilier:Categorie{Name:'Mobilier',Description:'Pour meubler',datecreation:'2017-09-24'})
CREATE (Décoration:Categorie{Name:'Décoration',Description:'Pour faire Beau',datecreation:'2018-09-14'})
CREATE (Velo:Categorie{Name:'Velo',Description:'Tout roule',datecreation:'2018-05-23'})
//Produits
CREATE (ordi1:Produit{reference:'ordi1',Description:'Super Ordinateur',dateajout:'2017-02-02', lieufabrication:'Munich'})
CREATE (ordi2:Produit{reference:'ordi2',Description:'Ordinateur pas top',dateajout:'2017-12-02', lieufabrication:'Pékin'})
CREATE (marteau1:Produit{reference:'marteau1',Description: 'efficace',dateajout:'2018-02-02', lieufabrication:'Paris'})
CREATE (morceaux_bois:Produit{reference:'morceaux_bois',Description: 'robuste',dateajout:'2016-05-02', lieufabrication:'Lille'})
CREATE (evier02:Produit{reference:'evier02',Description: 'en aluminium',dateajout:'2015-05-02', lieufabrication:'Berlin'})
CREATE (evier03:Produit{reference: 'evier03', Description:'en ethan',dateajout:'2015-05-02', lieufabrication:'Rome'})
CREATE (frigo02:Produit{reference:'frigo02',Description: 'tres froid',dateajout:'2015-09-02', lieufabrication:'Helsinki'})
CREATE (enceinte3:Produit{reference:'enceinte3',Description: 'music is life', dateajout:'2017-05-02', lieufabrication:'Brest'})
CREATE (fourchette:Produit{reference:'fourchette', Description: 'manger',dateajout:'2011-05-02', lieufabrication:'New-York'})
CREATE (vase:Produit{reference:'vase', Description:'Vive les fleurs',dateajout:'2011-04-12', lieufabrication:'New-York'})
//Administrateur
CREATE(admin1:Administrateur{Name:'Thomas',login:'a000001'})
CREATE(admin2:Administrateur{Name:'Lila',login:'a000002'})
CREATE(admin3:Administrateur{Name:'Marcel',login:'a000003'})
//Appartenir
CREATE (ordi1)-[:Appartient]->(HighTech)
CREATE (ordi2)-[:Appartient]->(HighTech)
CREATE (marteau1)-[:Appartient]->(Bricolage)
CREATE (morceaux_bois)-[:Appartient]->(Bricolage)
CREATE (morceaux_bois)-[:Appartient]->(Décoration)
CREATE (evier02)-[:Appartient]->(Cuisine)
CREATE (evier02)-[:Appartient]->(Mobilier)
CREATE (evier03)-[:Appartient]->(Mobilier)
CREATE (evier03)-[:Appartient]->(Cuisine)
CREATE (frigo02)-[:Appartient]->(Mobilier)
CREATE (enceinte3)-[:Appartient]->(HighTech)
CREATE (enceinte3)-[:Appartient]->(Décoration)
CREATE (fourchette)-[:Appartient]->(Cuisine)
CREATE (vase)-[:Appartient]->(Décoration)
//Creer
CREATE (admin1)-[:Cree]->(HighTech)
CREATE (admin1)-[:Cree]->(Bricolage)
CREATE (admin1)-[:Cree]->(Cuisine)
CREATE (admin2)-[:Cree]->(Mobilier)
CREATE (admin2)-[:Cree]->(Décoration)
CREATE (admin2)-[:Cree]->(Velo)
//ARTICLE 
CREATE (A1:Article{Intitulé:'Promo enceintes',Contenu:'Déstockage massif de nos enceintes pour le nouvel an !', Datepublication:'2017-12-24'})
CREATE (A2:Article{Intitulé:'Maintenance', Contenu:'Le site sera en maintenance demain', Datepublication:'2018-11-14'})
CREATE (A3:Article{Intitulé:'Canicule', Contenu: 'Achetez un de nos frigos en cette période de canicule !', Datepublication:'2018-07-14'})
CREATE (A4:Article{Intitulé:'Rabais eviers', Contenu:'Grace à un surplus de production, profitez de plusieurs réductions sur les eviers !', Datepublication:'2018-10-21'})
CREATE (A5:Article{Intitulé:'Candidature acteur',Contenu:'Nous recherchons des acteurs amateurs sur Paris !',Datepublication:'2018-11-01'})
//MET EN LIGNE
CREATE (admin1)-[:MET_EN_LIGNE]->(A1)
CREATE (admin2)-[:MET_EN_LIGNE]->(A2)
CREATE (admin1)-[:MET_EN_LIGNE]->(A3)
CREATE (admin3)-[:MET_EN_LIGNE]->(A4)
CREATE (admin2)-[:MET_EN_LIGNE]->(A5)
//PROUMOUVOIT
CREATE (A1)-[:PROUMOUVOIT]->(enceinte3)
CREATE (A3)-[:PROUMOUVOIT]->(frigo02)
CREATE (A4)-[:PROUMOUVOIT]->(evier02)
