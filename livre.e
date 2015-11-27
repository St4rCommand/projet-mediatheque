class LIVRE
--
-- Un média qui compose la médiathèque
--
--

inherit 
	MEDIA

creation {ANY}
    nouveau_livre,
    nouveau_livre1,
    nouveau

feature {NONE}
	-- L'attribut propre au livre
	-- auteur
	auteur : STRING

feature {ANY}


	-- Constructeur
	nouveau_livre (p_titre: STRING; p_auteur: STRING; p_nombre: INTEGER) is
    	local
		do
            create titre.make_from_string(p_titre)
            nombre := p_nombre
			create auteur.make_from_string(p_auteur)
		end

    -- Constructeur
	nouveau_livre1 (p_titre: STRING; p_auteur: STRING) is
    	local
		do
			create titre.make_from_string(p_titre)
			create auteur.make_from_string(p_auteur)
		end
end





	

