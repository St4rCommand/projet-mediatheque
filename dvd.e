class DVD
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
    nouveau_dvd, nouveau

feature {NONE}
	-- Les attributs du DVD
	-- Année
	annee : INTEGER

	-- Type
	type : STRING

	--Acteurs
	--acteurs: ARRAY[ACTEUR]

feature {ANY}

    -- Constructeur
    nouveau is
        do
            create titre.make_empty
            create type.make_empty            
            annee := 0
            nombre := 0
        end

	--constructeur
	nouveau_dvd (d_titre: STRING; d_annee: INTEGER; d_type: STRING; d_nombre: INTEGER) is
	    local
		do
			create titre.make_from_string(d_titre)
            nombre := d_nombre
			annee := d_annee
			create type.make_from_string(d_type)
		end

    -- Set annee
    set_annee (p_annee: INTEGER) is
        do
            annee := p_annee
        end

    -- Set type
    set_type (p_type: STRING) is
        do
            type := p_type
        end

    -- Get annee
    get_annee: INTEGER is
        do
            Result := annee
        end

    -- Get type
    get_type: STRING is
        do
            Result := type
        end

    -- To string
    to_string: STRING is
        do
            Result := "DVD : " + titre + " réalisé par ____ en " + annee.to_string + " (" + nombre.to_string + " exemplaires)"
        end
end





	

