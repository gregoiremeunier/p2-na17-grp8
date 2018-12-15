/*
		Groupe 8 - NA17 A18 - Projet 2

Membres du groupe 8 :
SUN Jian
HEYMAN Pierrick
EL BLIDI Yasmine
MEUNIER Grégoire

SQL INSERT : MongoDB

*/

use projet2
db.produits.drop()

//produit :VALUES ('ordi1', 'super ordinateur', 0, 500, '2017-02-02', 'Munich', 2, 'v000001', 0, NULL, NULL, NULL);
////avis1 : INSERT INTO avis(idAvis, note, description, date_evaluation, redigePar, evalue)
////avis1 : VALUES (5, 2, 'mauvais produit', '2014-05-13', 'ac000004', 'ordi1');
////avis2 : VALUES (1, 5, 'Excellent produit', '2018-01-13', 'ac000001', 'ordi1');
////avis2 : VALUES (3, 4, 'bon produit', '2016-03-15', 'ac000002', 'ordi1');
db.produits.insert(
  {
    reference:'ordi1',
    description: 'super ordinateur',
    occasion:false, //false=0, true=1
    //prix:500,
    date_ajout:'2017-02-02',
    lieu_fabrication:'Munich',
    //stock:2,
    vendeur:'v000001',
    //produitVedette:0,
    //date_fin:0,
    //importance:NULL,
    //nommePar:NULL,
    avis:
      [
        { //avant d'ecrire un avis, il faudra regarder si un acheteur n'a pas déjà écrit un avis
          note:2,
          description:'mauvais produit',
          date_evaluation:'2014-05-13',
          redigePar:'ac000004'
        },
        {
          note:5,
          description:'Excellent produit',
          date_evaluation:'2018-01-13',
          redigePar:'ac000001'
        },
        {
          note:4,
          description:'bon produit',
          date_evaluation:'2016-03-15',
          redigePar:'ac000002'
        }
      ]
    }
)

//ordi2 : VALUES ('ordi2', 'ordinateur pas top', 0, 50, '2017-12-02', 'Pékin', 5, 'v000001', 0, NULL, NULL, NULL);
////avis1 : VALUES (2, 3, 'Produit moyen', '2017-02-15', 'ac000001', 'ordi2');
////avis2 : VALUES (4, 2, 'mauvais produit', '2015-04-14', 'ac000003', 'ordi2');
db.produits.insert(
  {
    reference:'ordi2',
    description: 'Ordinateur pas top',
    occasion:false,
    date_ajout:'2015-01-02',
    lieu_fabrication:'Pékin',
    vendeur:'v000001',
    avis:
      [
        {
          note:3,
          description:'Produit moyen',
          date_evaluation:'2017-02-15',
          redigePar:'ac000001'
        },
        {
          note:2,
          description:'mauvais produit pas top',
          date_evaluation:'2015-04-14',
          redigePar:'ac000003'
        }
      ]
  }
)

//VALUES ('marteau1', 'efficace', 1, 5, '2018-02-02', 'Paris', 10, 'v000002', 0, NULL, NULL, NULL);
//// avis1 : VALUES (8, 5, 'Excellent produit', '2011-08-11', 'ac000005', 'marteau1');
db.produits.insert(
  {
    reference:'marteau1',
    description: 'efficace',
    occasion:true,
    date_ajout:'2018-02-02',
    lieu_fabrication:'Paris',
    vendeur:'v000002',
    avis:
      [
        {
          note:5,
          description:'Excellent produit',
          date_evaluation:'2018-08-11',
          redigePar:'ac000005'
        }
      ]
    }
)

//VALUES ('morceaux_bois', 'robuste', 1, 1.5, '2016-05-02', 'Lille', 2, 'v000002', 0, NULL, NULL, NULL);
////avis1 : VALUES (7, 5, 'Excellent produit', '2012-07-12', 'ac000004', 'morceaux_bois');
db.produits.insert(
  {
    reference:'morceaux_bois',
    description: 'Robuste',
    occasion:true,
    date_ajout:'2012-05-02',
    lieu_fabrication:'Lille',
    vendeur:'v000002',
    avis:
      [
        {
          note:5,
          description:'Excellent produit',
          date_evaluation:'2017-07-12',
          redigePar:'ac000004'
        }
      ]
    }
)

//  VALUES ('evier02', 'en aluminium', 0, 150, '2015-05-02', 'Berlin', 12, 'v000003', 1, '2018-12-12', 3, 'a000001');
////avis1:  VALUES (6, 1, 'tres mauvais produit', '2013-06-12', 'ac000004', 'evier02');
db.produits.insert(
  {
    reference:'evier02',
    description: 'en aluminium',
    occasion:false,
    date_ajout:'2015-05-02',
    lieu_fabrication:'Berlin',
    vendeur:'v000003',
    avis:
      [
        {
          note:1,
          description:'tres mauvais produit',
          date_evaluation:'2015-06-12',
          redigePar:'ac000004'
        }
      ]
    }
)

// VALUES ('evier03', 'en étain', 1, 250, '2015-05-02', 'Rome', 102, 'v000003', 0, NULL, NULL, NULL);
db.produits.insert(
  {
    reference:'evier03',
    description: 'En étain',
    occasion:true,
    date_ajout:'2015-05-02',
    lieu_fabrication:'Rome',
    vendeur:'v000003',
    }
)

//VALUES ('frigo02', 'très froid', 1, 350, '2015-09-02', 'Helsini', 12, 'v000004', 1, '2019-01-01', 2, 'a000003');
db.produits.insert(
  {
    reference:'frigo02',
    description: 'Très froid',
    occasion:true,
    date_ajout:'2015-09-02',
    lieu_fabrication:'Helsinki',
    vendeur:'v000004',
    }
)

//VALUES ('enceinte3', 'music is life', 1, 550, '2017-05-02', 'Brest', 120, 'v000004', 1, '2018-12-25', 1, 'a000003');
db.produits.insert(
  {
    reference:'enceinte3',
    description: 'Music is Life',
    occasion:true,
    date_ajout:'2017-05-02',
    lieu_fabrication:'Brest',
    vendeur:'v000004',
    }
)

//VALUES ('fourchette', 'manger !!', 0, 0.5, '2011-05-02', 'New-York', 1120, 'v000004', 0, NULL, NULL, NULL);
db.produits.insert(
  {
    reference:'fourchette',
    description: 'Manger !!!',
    occasion: false,
    date_ajout:'2011-05-02',
    lieu_fabrication:'New-York',
    vendeur:'v000004',
    }
)

//VALUES ('vase', 'Vive les fleurs', 0, 10, '2011-04-12', 'New-York', 1120, 'v000004',1, '2018-12-25', 1, 'a000003');
db.produits.insert(
  {
    reference:'vase',
    description: 'Vive les fleurs',
    occasion: false,
    date_ajout:'2011-04-12',
    lieu_fabrication:'Amsterdam',
    vendeur:'v000004',
    }
)

db.produits.find()
