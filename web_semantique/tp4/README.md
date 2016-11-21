**Tous les noms de plats**
```ttl
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix owl: <http://www.w3.org/2002/07/owl#>

SELECT ?subject ?predicat ?object
WHERE {
  ?subject rdfs:subClassOf <http://www.univrouen.fr/ontologies/restaurant#Menu> .
  ?object rdfs:subClassOf ?subject
}
```

**Tous les noms de plats commençant par S**
```ttl
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix owl: <http://www.w3.org/2002/07/owl#>

SELECT ?subject
WHERE {
  ?subject rdfs:subClassOf <http://www.univrouen.fr/ontologies/restaurant#dessert>
}
```


```ttl
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix owl: <http://www.w3.org/2002/07/owl#>

SELECT ?subject ?predicat ?object
WHERE {
  ?subject rdfs:subClassOf <http://www.univrouen.fr/ontologies/restaurant#dessert> .
  ?subject ?predicat ?object .
  FILTER regex(?object, "^C.*", "i")
}
```

