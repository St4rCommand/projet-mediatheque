class DVD
--
-- Un média qui compose la médiathèque
--
--

inherit 
	MEDIA

    redefine
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
            nombre := 1
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

    -- Ajout d'un réalisateur à la liste des réalisateurs    
    add_realisateur (p_realisateur: STRING) is
        do
            realisateurs.add_last(p_realisateur)
        end
    
    -- Ajout d'un acteur à la liste des acteurs
    add_acteur (p_acteur: STRING) is
        do
            acteurs.add_last(p_acteur)
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
        
    --- Vérifier si le réalisateur fait parti de la liste des réalisateurs 
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
        
    --- Vérifier si l'acteur fait parti de la liste des acteurs 
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
    
    --- Vérifier l'année     
    has_annee(p_annee: INTEGER):BOOLEAN is
        do
            if p_annee = -1 or p_annee = annee then
                Result := True
            else 
                Result := False
            end
        end

    -- To string
    to_string: STRING is
        do
            Result := "DVD : " + titre + " réalisé par ____ en " + annee.to_string + " (" + nombre.to_string + " exemplaires)"
        end
        
    -- Comparaison
    standard_equal(p_media: MEDIA): BOOLEAN is
        local
            dvd: DVD
        do
            dvd ?= p_media
            
            if dvd /= Void
            and then dvd.get_titre.as_lower.has_substring(titre.as_lower) 
            and then dvd.get_realisateurs.is_equal(realisateurs)
            and then dvd.get_acteurs.is_equal(acteurs)
            and then dvd.get_annee = annee
            then
                Result := True
            else
                Result := False
            end
        end
end





	

