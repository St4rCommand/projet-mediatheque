class AFFICHAGE_MENUS
	
feature {ANY}
    
    afficher_lancement is
        do
            io.put_string("==================================%N")
            io.put_string("=== Bienvenue à la médiathèque ===%N")
            io.put_string("==================================%N%N")
        end
        
    afficher_menu_principal: INTEGER is
        local
            choix_menu:STRING
        do
            choix_menu := ""
        
            io.put_string(" *** Menu principal *** %N%N")
            io.put_string(" 1 - Se connecter %N")
            io.put_string(" 2 - Consulter médias%N")
            io.put_string("%N 0 - Quitter%N")
            io.put_string("%N --- %N")
            
            from
            until choix_menu.is_integer
            loop
                io.put_string(" Choix : ")
                io.read_line
                choix_menu := io.last_string
            end
            
            io.put_string("%N ****** %N%N")
            
            Result := choix_menu.to_integer
        end
        
    afficher_menu_medias: INTEGER is
        local
            choix_menu:STRING
        do
            choix_menu := ""
        
            io.put_string(" *** Menu principal *** %N%N")
            io.put_string(" 1 - Consulter %N")
            io.put_string(" 2 - Ajouter%N")
            io.put_string(" 3 - Modifier%N")
            io.put_string("%N 0 - Quitter%N")
            io.put_string("%N --- %N")
            
            from
            until choix_menu.is_integer
            loop
                io.put_string(" Choix : ")
                io.read_line
                choix_menu := io.last_string
            end
            
            io.put_string("%N ****** %N%N")
            
            Result := choix_menu.to_integer
        end
        
	afficher_menu_utilisateur:INTEGER is
         local
            choix_sous_menu:STRING
        do
            choix_sous_menu := ""
        
            io.put_string(" *** Menu admin *** %N%N")
            io.put_string(" 1 - Lister les utilisateurs%N")
            io.put_string(" 2 - Ajouter un utilisateur%N")
            io.put_string("%N 0 - Menu principal%N")
            io.put_string("%N --- %N")
            
            from
            until choix_sous_menu.is_integer
            loop
                io.put_string(" Choix : ")
                io.read_line
                choix_sous_menu := io.last_string
            end
            
            io.put_string("%N ****** %N%N")
            
            Result := choix_sous_menu.to_integer
        end
        
    afficher_erreur_saisie_menu is
        do
            io.put_string(" ***%N")
            io.put_string(" *** Le choix du menu ne correspond à aucune option%N")
            io.put_string(" ***%N%N")
        end
        
    afficher_retour_menu_principal is
        do
        
        end
        
    afficher_sortie_programme is
        do
            io.put_string("================================%N")
            io.put_string("=== Au revoir et à bientôt ! ===%N")
            io.put_string("================================%N%N")
        end
        
	saisir_identifiant: STRING is
        local
            identifiant:STRING
        do
            identifiant := ""
            io.put_string(" Saisir votre identifiant : ")
            io.read_line
            identifiant := io.last_string
            
            Result := identifiant
        end
        
    afficher_saisie_identifiant_incorrecte is
        do
            io.put_string(" ***%N")
            io.put_string(" *** Aucun utilisateur ne correspond à cet identifiant%N")
            io.put_string(" ***%N%N")
        end
end
