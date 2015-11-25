class DVD
--
-- Un média qui compose la médiathèque
--
--

inherit 
	MEDIA

feature {NONE}
	-- Les attributs du DVD
	-- année
	annee : STRING

	-- Réalisateur
	realisateur : STRING

	-- Type
	type : STRING

	--Acteurs
	--acteurs: ARRAY[ACTEUR]

feature {ANY}
	--constructeur
	nouveau (d_titre: STRING, d_annee: STRING, d_realisateur: STRING, d_type: STRING, d_nombre: INTEGER) is
	local
		do
			create media.(titre.make_from_make(d_titre))
			create media.(nombre.make_from_make(d_nombre))
			annee := d_annee
			create realisateur.make_from_make(d_realisateur)
			create type.make_from_make(d_type)
	
		end
end





	

