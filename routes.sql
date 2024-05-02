-- Kilométrage des routes départementales par commune
SELECT SUM(ST_Length(geom))/1000 as km_routes_dep_com, insee_commune_gauche as insee_com
FROM ref_reseaux.ign_topo_troncon_de_route_fr_2154
WHERE cpx_classement_administratif IN ('Départementale')
GROUP BY insee_commune_gauche;


-- Kilométrages des routes départementales par département 
SELECT SUM(ST_Length(geom))/1000 km_routes_dep_dep, SUBSTR(insee_commune_gauche, 1, 2) as code_dep
FROM ref_reseaux.ign_topo_troncon_de_route_fr_2154
WHERE cpx_classement_administratif IN ('Départementale')
GROUP BY SUBSTR(insee_commune_gauche, 1, 2);
