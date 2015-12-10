class LISTE_UTILISATEURS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des UTILISATEURS
    liste_utilisateurs: ARRAY[UTILISATEUR]
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_utilisateurs.make(0,0)
        end

	-- Lister les utilisateurs		
	lister_utilisateurs:ARRAY[UTILISATEUR] is
    do
        Result := liste_utilisateurs
    end

    -- Ajouter
    ajouter_utilisateur(p_utilisateur: UTILISATEUR) is
        do
            liste_utilisateurs.add_last(p_utilisateur)
        end
        
    -- Ajouter une liste d'utilisateurs
    ajouter_utilisateurs(p_utilisateurs: ARRAY[UTILISATEUR]) is
        do
            liste_utilisateurs.append_collection(p_utilisateurs)
        end

	-- On recherche l'unicité de l'identifiant
	existe_id(identifiant:STRING):BOOLEAN is
	    do
	        if get_utilisateur(identifiant) = Void then
	            Result := False
            else
                Result := True
            end
	    end
		
	get_utilisateur(p_identifiant : STRING):UTILISATEUR is
		local
			i : INTEGER	
			existe : BOOLEAN	
		do
			from i := 1
			until existe or i = liste_utilisateurs.count
			loop
				existe := p_identifiant.is_equal((liste_utilisateurs.item(i)).get_identifiant)				
				i := i+1
			end
			
			if existe then
				Result := liste_utilisateurs.item(i-1)			
			else
    			Result := Void
			end
		end
		
	--valid_identifiant(p_string: STRING): STRING is
	 --   do
	 --       p_string.left_adjust
	 --       p_string.right_adjust
	        
	  --      if p_string.first_substring_index(" ") = 0 else
	 --           Result := p_string
     --       else
      --          Result := Void
      --      end
	  --  end
        
end
