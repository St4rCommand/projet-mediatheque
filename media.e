class MEDIA

creation {ANY}
    nouveau,
	nouveau1,
	nouveau2

feature {NONE}
    -- Titre du média
    titre: STRING
    
    --Nombre d'exemplaire du média
    nombre: INTEGER
    

feature {ANY}

    -- Constructeur
    nouveau is
        require
            --identifiant unique
        local
        do

        end

	
	-- Constructeur
	nouveau1 (p_titre: STRING; p_nombre:INTEGER) is
	    require
	        -- identifiant unique
        local
		do
			create titre.make_from_string(p_titre)
			nombre := p_nombre
		end
		
	-- Constructeur
	nouveau2 (p_titre: STRING) is
	    require
	        -- identifiant unique
        local
		do
			create titre.make_from_string(p_titre)
		end

    -- Set titre
    set_titre (p_titre: STRING) is
        do
            titre := p_titre
        end

    -- Set nombre
    set_nombre (p_nombre: INTEGER) is
        do
            nombre := p_nombre
        end
end
