class LIVRE
--
-- Un média qui compose la médiathèque
--
--

inherit 
	MEDIA

    redefine
        nouveau,
        to_string
    end 

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
    nouveau is
        do
            create titre.make_empty
            create auteur.make_empty
            nombre := 1
        end

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

    -- Set auteur
    set_auteur (p_auteur: STRING) is
        do
            auteur := p_auteur
        end

    -- Get auteur
    get_auteur: STRING is
        do
            Result := auteur
        end

    -- To string
    to_string: STRING is
        do
            Result := "Livre : " + titre + " de " + auteur + "(" + nombre.to_string + " exemplaires)"
        end
end





	

