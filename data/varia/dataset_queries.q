# NEEDS TO BE UPDATED

########## Query Q1 ###########

PREFIX viaf: <http://viaf.org/viaf/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ow: <http://www.omac.org/work#>
PREFIX od: <http://www.omac.org/data#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX dbp: <http://dbpedia.org/property/>

select * where {
?musical_work rdf:type ow:MusicalWork;
                  dbp:genre <http://dbpedia.org/resource/Mass_(music)>;
                  dcterms:title ?work_title;
                   ow:has_section ?section.
 ?section ow:section_order ?section_order.
 OPTIONAL {?section ow:has_subsection ?subsection}
}

########## Query Q2 ###########
PREFIX viaf: <http://viaf.org/viaf/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ow: <http://www.omac.org/work#>
PREFIX od: <http://www.omac.org/data#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX dbp: <http://dbpedia.org/property/>

select * where {
?musical_work rdf:type ow:MusicalWork;
                  dbp:genre <http://dbpedia.org/resource/Mass_(music)>;
                  dcterms:title ?work_title.
    OPTIONAL {?musical_work ow:has_subsection ?subsection}
}

########## Query Q3 ###########
PREFIX viaf: <http://viaf.org/viaf/>
PREFIX dbp: <http://dbpedia.org/property/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX ow: <http://www.omac.org/work#>
PREFIX od: <http://www.omac.org/data#>
PREFIX dcterms: <http://purl.org/dc/terms/>

select ?work_title ?section  ?composer_name where {
	viaf:313248882 dcterms:title ?work_title;
                  ow:has_section ?section.
?section dbp:genre dbr:Kyrie;
        ow:composed_by ?composer.
?composer dbp:name ?composer_name}


########## Query Q4 ###########
PREFIX dbp: <http://dbpedia.org/property/>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX viaf: <http://viaf.org/viaf/>
PREFIX ow: <http://www.omac.org/work#>

select  ?title ?genre ?composition_date ?composer_name where {
	viaf:313248882 dcterms:title ?title;
                dbp:genre ?genre;
                dbp:composed ?composition_date;
                ow:composed_by ?composer.
    ?composer dbp:name ?composer_name.
}

########## Query Q5 ###########
PREFIX viaf: <http://viaf.org/viaf/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ow: <http://www.omac.org/work#>
PREFIX dbp: <http://dbpedia.org/property/>
PREFIX dcterms: <http://purl.org/dc/terms/>

select ?title ?composer_name ?performing_force_type ?performing_force_quantity where {
	viaf:294918919 dcterms:title ?title;
                ow:composed_by ?composer.
    ?composer dbp:name ?composer_name.
     viaf:294918919 ow:scored_for ?performing_force.
    ?performing_force ow:performing_force_type ?performing_force_type;
    			ow:number_performing_force ?performing_force_quantity.
}
########## Query Q6 ###########

PREFIX oc: <http://www.omac.org/claim#>
PREFIX od: <http://www.omac.org/data#>
PREFIX dcterms: <http://purl.org/dc/terms/>

select * where {
od:Tota_pulchra_es
     dcterms:title ?work_title;
        oc:related_to ?claim.
    ?claim oc:stated_by ?analyst
}

########## Query Q7 ###########

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX oc: <http://www.omac.org/claim#>
PREFIX od: <http://www.omac.org/claim#>

select * where {
	?analytic_claim rdf:type oc:AnalyticSegmentClaim;
                  ?predicate ?object
    FILTER (!isBlank(?object))
}

########## Query Q8 ###########

PREFIX oc: <http://www.omac.org/claim#>
PREFIX od: <http://www.omac.org/data#>
PREFIX ow: <http://www.omac.org/work#>

select * where {
	?model rdf:type ow:MusicalEntity;
        oc:model_for ?derivative.
}

########## Query Q9 ###########

PREFIX oc: <http://www.omac.org/claim#>
PREFIX od: <http://www.omac.org/data#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT  * WHERE {
    ?rel rdf:type oc:MusicalRelationship;
                  ?property ?object.
   FILTER (!isBlank(?object))
   }
