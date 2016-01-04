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
    ajouter(p_utilisateur: UTILISATEUR) is
        do
            liste_utilisateurs.add_last(p_utilisateur)

        end
        
    -- Ajouter une liste d'utilisateurs
    ajouter_liste(p_utilisateurs: ARRAY[UTILISATEUR]) is
        local
            i:INTEGER
        do
        
            from i:= 1
            until i = p_utilisateurs.count
            loop
                ajouter(p_utilisateurs.item(i))
                i := i+1
            end
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

	position_utilisateur(p_utilisateur:UTILISATEUR):INTEGER is
		local
			i:INTEGER
			existe:BOOLEAN
		do
		
    		from i := 1
			until existe or i = liste_utilisateurs.count
			loop
				existe := p_utilisateur.get_identifiant.is_equal((liste_utilisateurs.item(i)).get_identifiant)				
				i := i+1
			end
			
			if existe then
				Result := i-1
			else
    			Result := 0
			end

		end


	rechercher_admin(p_identifiant: STRING; p_nom:STRING; p_prenom:STRING; p_admin:BOOLEAN):ARRAY[UTILISATEUR] is
		local
			admin_courant: UTILISATEUR
			admin_trouves: ARRAY[UTILISATEUR]
			i:INTEGER
		do
			create admin_trouves.make(0,0)
            
            from i:=1
            until i = liste_utilisateurs.count
            loop
                admin_courant := liste_utilisateurs.item(i)
                
                if admin_courant /= Void
                and then admin_courant.get_identifiant.has_substring(p_identifiant) 
                and then admin_courant.get_nom.has_substring(p_nom)
                and then admin_courant.get_prenom.has_substring(p_prenom)
                and then admin_courant.is_admin
                then
                    admin_trouves.add_last(admin_courant)
                end
                
                i := i+1
            end
            
            Result := admin_trouves
		end

	rechercher_client(p_identifiant: STRING; p_nom:STRING; p_prenom:STRING; p_admin:BOOLEAN):ARRAY[UTILISATEUR] is
		local
			client_courant: UTILISATEUR
			client_trouves: ARRAY[UTILISATEUR]
			i:INTEGER
		do
			create client_trouves.make(0,0)
            
            from i:=1
            until i = liste_utilisateurs.count
            loop
                client_courant := liste_utilisateurs.item(i)
                
                if client_courant /= Void
                and then client_courant.get_identifiant.has_substring(p_identifiant) 
                and then client_courant.get_nom.has_substring(p_nom)
                and then client_courant.get_prenom.has_substring(p_prenom)
                and then not (client_courant.is_admin)
                then
                    client_trouves.add_last(client_courant)
                end
                
                i := i+1
            end
            
            Result := client_trouves
		end
        
end
