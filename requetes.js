//query.js

conn = new Mongo();

db = conn.getDB("projet2");

//Affiche la reference des produits ajoutés le 2017-02-02
res = db.produits.find({"date_ajout":"2017-02-02"},{"_id":0,"reference":1});
while ( res.hasNext() ) {
  printjson(res.next());
  print("- ", produits.reference);
}

//Affiche la reference des produits d'occasion
res = db.produits.find({"occasion":true},{"_id":0,"reference":1});
while ( res.hasNext() ) {
  printjson(res.next());
  print("- ", produits.reference);
}

//Affiche la reference des produits et sa note lorsqu'elle est inférieur à 3
res = db.produits.find({"avis.note":{$lt:3}},{"_id":0,"reference":1, "avis":1});
while ( res.hasNext() ) {
  printjson(res.next());
  print("- ", produits.reference);
}

//Affiche les produits avec au moins une note inférieur à 3
res = db.produits.find({});
while ( res.hasNext() ) {
  printjson(res.next());
}
