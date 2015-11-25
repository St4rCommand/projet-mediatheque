class LIVRE
--
-- Un média qui compose la médiathèque
--
--

inherit 
	MEDIA

feature {NONE}
	-- L'attribut propre au livre
	-- auteur
	auteur : STRING


feature {ANY}
	--constructeur
	nouveau (l_titre: STRING, l_auteur: STRING, l_nombre: INTEGER) is
	local
		do
			create media.(titre.make_from_make(l_titre))
			create media.(nombre.make_from_make(l_nombre))
			create auteur.make_from_make(l_realisateur)
	
		end
	nouveau1 (l_titre: STRING, l_auteur: STRING) is
	local
		do
			create media.(titre.make_from_make(l_titre))
			create auteur.make_from_make(l_auteur)
		end
end





	

