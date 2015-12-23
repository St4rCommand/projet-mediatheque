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
  
   -- Realisateurs
   realisateurs: ARRAY[STRING]
   
   -- Acteurs
   acteurs: ARRAY[STRING]

feature {ANY}

    -- Constructeur
    nouveau is
        do
            create titre.make_empty
            create type.make_empty
            create realisateurs.make(0,0)
            create acteurs.make(0,0)         
            annee := 0
            nombre := 0
        end

	--constructeur
	nouveau_dvd (d_titre: STRING; d_annee: INTEGER; d_type: STRING; d_nombre: INTEGER; d_realisateurs: ARRAY[STRING]; d_acteurs: ARRAY[STRING]) is
	    local
		do
			create titre.make_from_string(d_titre)
            nombre := d_nombre
			annee := d_annee
			create type.make_from_string(d_type)
			create realisateurs.from_collection(d_realisateurs)
			create acteurs.from_collection(d_acteurs)
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

    -- Set realisateurs
    add_realisateurs (p_realisateurs: ARRAY[STRING]) is
        do
            realisateurs.append_collection(p_realisateurs)
        end

    -- Set acteurs
    add_acteurs (p_acteurs: ARRAY[STRING]) is
        do
            acteurs.append_collection(p_acteurs)
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
        
    -- Get realisateurs
    get_realisateurs: ARRAY[STRING] is
        do
            Result := realisateurs
        end
        
    -- Get acteurs
    get_acteurs: ARRAY[STRING] is
        do
            Result := acteurs
        end
        
     
    has_realisateur(p_realisateur: STRING):BOOLEAN is
        local
            i: INTEGER
        do
            Result := False
            
            from i:=1
            until i = realisateurs.count
            loop
                if realisateurs.item(i).as_lower.has_substring(p_realisateur.as_lower) then
                    Result := True
                end
                
                i:=i+1
            end
        end
        
    has_acteur(p_acteur: STRING):BOOLEAN is
        local
            i: INTEGER
        do
            Result := False
            
            from i:=1
            until i = acteurs.count
            loop
                if acteurs.item(i).as_lower.has_substring(p_acteur.as_lower) then
                    Result := True
                end
                
                i:=i+1
            end
            
        end
        
    has_annee(p_annee: INTEGER):BOOLEAN is
        do
            if p_annee = -1 or p_annee /= annee then
                Result := False
            else
                Result := True
            end
        end

    -- To string
    to_string: STRING is
        do
            Result := "DVD : " + titre + " réalisé par ____ en " + annee.to_string + " (" + nombre.to_string + " exemplaires)"
        end
end





	

