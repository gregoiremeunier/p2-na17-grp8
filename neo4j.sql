//Categories
CREATE (HighTech:Categorie{Name:'High-Tech',Description:'Nouvelles Technologies',datecreation:'2017-08-02'})
CREATE (Bricolage:Categorie{Name:'Bricolage',Description:'Tout pour la maison',datecreation:'2017-08-22'})
CREATE (Cuisine:Categorie{Name:'Cuisine',Description:'Pour manger',datecreation:'2017-09-12'})
CREATE (Mobilier:Categorie{Name:'Mobilier',Description:'Pour meubler',datecreation:'2017-09-24'})
CREATE (Décoration:Categorie{Name: 'Décoration', Description:'Pour faire Beau',datecreation:'2018-09-14'})
CREATE (Velo:Categorie{Name:'Velo', Description:'Tout roule',datecreation:'2018-05-23'})
//Produits
CREATE (ordi1:Produit{reference:'ordi1',Description:'Super Ordinateur'})
CREATE (ordi2:Produit{reference:'ordi2',Description:'Ordinateur pas top'})
CREATE (marteau1:Produit{reference:'marteau1',Description: 'efficace'})
CREATE (morceaux_bois:Produit{reference:'morceaux_bois',Description: 'robuste'})
CREATE (evier02:Produit{reference:'evier02',Description: 'en aluminium'})
CREATE (evier03:Produit{reference: 'evier03', Description:'en ethan'})
CREATE (frigo02:Produit{reference:'frigo02',Description: 'tres froid'})
CREATE (enceinte3:Produit{reference:'enceinte3',Description: 'music is life'})
CREATE (fourchette:Produit{reference:'fourchette', Description: 'manger !!'})
CREATE (vase:Produit{reference:'vase', Description:'Vive les fleurs'})
//Administrateur
CREATE(admin1:Administrateur{login:'a000001'})
CREATE(admin2:Administrateur{login:'a000002'})
//Appartenir
CREATE (ordi1)-[:Appartient]->(HighTech)
CREATE (ordi2)-[:Appartient]->(HighTech)
CREATE (marteau1)-[:Appartient]->(Bricolage)
CREATE (morceaux_bois)-[:Appartient]->(Bricolage)
CREATE (morceaux_bois)-[:Appartient]->(Décoration)
CREATE (evier02)-[:Appartient]->(Cuisine)
CREATE (evier02)-[:Appartient]->(Mobilier)
CREATE (evier03)-[:Appartient]->(Mobilier)
CREATE (evier03)-[:Appartient]->(Mobilier)
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
CREATE (Maintenance:Article {intitule: 'Maintenance',
    contenu:'Le site sera en maintenance demain',
    auteur: 'OVH',
    date_publication: '2018-11-14',
    article_promotion: '0'}
)

CREATE (Canicule:Article {intitule: 'Canicule',
    contenu:'Achetez un de nos frigos en cette periode de canicule !',
    auteur: 'Frigo&Cpg',
    date_publication: '2018-07-14',
    article_promotion: '1'}
)
CREATE (Rabais_eviers:Article {intitule: 'Rabais_eviers',
    contenu:'Grace a  un surplus de production, profitez d''une reduc sur les eviers !',
    auteur: 'Jacob',
    date_publication: '2018-10-21',
    article_promotion: '1'}
)
CREATE (Candidature_acteur:Article {intitule: 'Candidature_acteur',
    contenu:'Nous recherchons des acteurs amateurs sur Paris !',
    auteur: 'Gaumont',
    date_publication: '2018-11-01',
    article_promotion: '0'}
)
//misEnLigne
CREATE (admin1)-[:met_en]->(Promo_enceintes)
CREATE (admin1)-[:met_en]->(Canicule)
CREATE (admin2)-[:met_en]->(Canicule)
