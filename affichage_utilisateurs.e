class AFFICHAGE_UTILISATEURS

inherit 
	AFFICHAGE
	
feature {NONE}
    
feature {ANY}

----
-- Afficher
----
        
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

	afficher_suppression_debut is
		do
			io.put_string(" *** Suppression d'un utilisateur *** %N%N")
		end

	afficher_demande_suppresion : STRING is
		local
			choix : STRING
        do
            io.put_string(" Confirmez-vous la suppression ?(O/N) : ")
			io.read_line
            choix := io.last_string

			Result := choix
			
		end

	afficher_suppression(p_identifiant:STRING) is
		do
			io.put_string(" *** L'utilisateur : " +p_identifiant+ "a été supprimé *** %N%N")
		end

	afficher_suppression_annulee is
        do
            io.put_string(" *** Suppression annulée *** %N%N")
        end
	
	afficher_erreur_suppression is
        do
            io.put_string(" *** Suppression impossible : emprunts en cours *** %N%N")
        end

    afficher_consultation is
        do
            io.put_string(" *** Consulter utilisateur *** %N%N")
        end
        
    afficher_fin_nouvel_utilisateur is
        do
			io.put_string(" ****** %N%N")
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

    champ_vide is
        do
            io.put_string(" ***%N")
            io.put_string(" *** Le champs est à vide%N")
            io.put_string(" ***%N%N")
        end

 	afficher_recherche_debut is
        do
            io.put_string(" *** Rechercher des utilisateurs *** %N%N")
        end

 	afficher_recherche_admin is
        do
            io.put_string(" *** Rechercher des administrateurs *** %N%N")
        end

 	afficher_recherche_client is
        do
            io.put_string(" *** Rechercher des clients *** %N%N")
        end
 
    afficher_recherche_fin is
        do
            io.put_string("%N ****** %N%N")
        end   
        
    afficher_recherche_menu_type : INTEGER is
		local
			choix : STRING
        do
            io.put_string(" Type d'utilisateurs à rechercher : %N%N")
            io.put_string(" 1 - Admin %N")
            io.put_string(" 2 - Client%N")
            io.put_string("%N 0 - Quitter%N")
            io.put_string("%N Choix : ")
			io.read_line
            choix := io.last_string

			Result := choix.to_integer
        end
        
    afficher_recherche_resultats(utilisateurs: ARRAY[UTILISATEUR]) is
        local
            i: INTEGER
            user_courant: UTILISATEUR
        do
            io.put_string("Résultats de la recherche : %N%N")

            from i := 1
            until i = utilisateurs.count
            loop
                user_courant := utilisateurs.item(i)
                io.put_string(i.to_string+"| ")
                                    
                io.put_string(user_courant.get_identifiant+"%N")
                
                i := i+1
            end
            
            io.put_string("%N --- %N")
        end

    info_debut is
        do
            io.put_string(" *** Mon compte client *** %N%N")
        end

    emprunt_debut is
        do
           io.put_string(" *** Mes emprunts *** %N%N") 
        end

----
-- Saisie
----

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

    saisir_utilisateur_selectionne(choix_max: INTEGER): INTEGER is
        local
            choix: STRING
        do
            create choix.make_empty
        
            from
            until choix_correct(choix, choix_max)
            loop
                io.put_string(" Choix (0 - Nouvelle recherche) : ")
				io.read_line
                choix := io.last_string
            end
            
            Result := choix.to_integer
            
            io.put_string(" --- %N%N")
        end
end
