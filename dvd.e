class DVD
--
-- Un média qui compose la médiathèque
--
--

inherit 
	MEDIA

creation {ANY}
    nouveau_dvd, nouveau

feature {NONE}
	-- Les attributs du DVD
	-- Année
	annee : INTEGER

	-- Réalisateur
	realisateur : STRING

	-- Type
	type : STRING

	--Acteurs
	--acteurs: ARRAY[ACTEUR]

feature {ANY}
	--constructeur
	nouveau_dvd (d_titre: STRING; d_annee: INTEGER; d_realisateur: STRING; d_type: STRING; d_nombre: INTEGER) is
	    local
		do
			create titre.make_from_string(d_titre)
            nombre := d_nombre
			annee := d_annee
			create realisateur.make_from_string(d_realisateur)
			create type.make_from_string(d_type)
		end
end





	

