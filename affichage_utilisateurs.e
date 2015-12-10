class AFFICHAGE_UTILISATEURS

feature {NONE}
    
feature {ANY}
        
    afficher_utilisateurs(p_utilisateurs: ARRAY[UTILISATEUR]) is
        local
            i: INTEGER
        do
        	io.put_string(" *** Liste des utilisateurs *** %N%N")    
    		from
			    i := 1
		    until
			    i = p_utilisateurs.count
		    loop
		        afficher_utilisateur(p_utilisateurs.item(i))
				i := i+1
		    end
        end
        
    afficher_utilisateur(p_utilisateur: UTILISATEUR) is
        do
            io.put_string("| Identifiant : "+p_utilisateur.get_identifiant+"%N")
            io.put_string("| Nom : "+p_utilisateur.get_nom+"%N")
            io.put_string("| Prénom : "+p_utilisateur.get_prenom+"%N")
            if p_utilisateur.is_admin then
               io.put_string("| Admin %N")
            else
                io.put_string("| Client %N")
            end
            io.put_string("%N")
        end
        
    afficher_nouvel_utilisateur_cree(p_utilisateur : UTILISATEUR) is
        do
            io.put_string("%N%N Utilisateur créé :%N")
            afficher_utilisateur(p_utilisateur)
        end
        
    afficher_nouvel_utilisateur is
        do
            io.put_string(" *** Nouvel Utilisateur *** %N%N")
        end
        
    afficher_fin_nouvel_utilisateur is
        do
			io.put_string(" ****** %N%N")
        end

	saisir_identifiant: STRING is
        local
            identifiant:STRING
        do
            identifiant := ""
            io.put_string(" Saisir votre identifiant : ")
            io.read_line
            identifiant := io.last_string
	       
	        identifiant.left_adjust
	        identifiant.right_adjust
           
            
            Result := identifiant
        end

	saisir_nom: STRING is
        local
            nom:STRING
        do
            nom := ""
            io.put_string(" Saisir votre nom : ")
            io.read_line
            nom := io.last_string
            
            Result := nom
        end

	saisir_prenom: STRING is
        local
            prenom:STRING
        do
            prenom := ""
            io.put_string(" Saisir votre prenom : ")
            io.read_line
            prenom := io.last_string
            
            Result := prenom
        end

	saisir_admin: STRING is
        local
            rep:STRING
        do
            rep := ""
            io.put_string(" administrateur (O/N)? ")
            io.read_line
            rep := io.last_string
            
            Result := rep
        end
        
    afficher_identifiant_existe is
        do
            io.put_string(" ***%N")
            io.put_string(" *** Identifiant déjà connu%N")
            io.put_string(" ***%N%N")
        end
        
    afficher_identifiant_incorrect is
        do
            io.put_string(" ***%N")
            io.put_string(" *** Identifiant a un espace%N")
            io.put_string(" ***%N%N")
        end

end
