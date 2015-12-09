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
		local
			i : INTEGER	
			existe : BOOLEAN	
		do
			from 
				i := 1
			until existe or i = liste_utilisateurs.count
			loop
				io.put_string (" i = "+i.to_string +"identifiant : "+liste_utilisateurs.item(i).get_identifiant)
				existe := identifiant.is_equal((liste_utilisateurs.item(i)).get_identifiant)			
				i := i+1
			end
			Result := existe
		end

        
end
