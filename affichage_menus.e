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
            io.put_string(" 1 - Utilisateurs %N")
            io.put_string(" 2 - Médias%N")
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
        
    afficher_menu_medias is
        do
            io.put_string(" *** Menu utilisateurs *** %N%N")
            io.put_string(" 1 - Afficher tous%N")
            io.put_string(" 2 - Rechercher%N")
            io.put_string("%N --- %N")
            io.put_string(" Choix : ")
            io.put_string(" ****** %N%N")
        end
	afficher_menu_admin is
        do
            io.put_string(" *** Menu admin *** %N%N")
            io.put_string(" 1 - Afficher tous %N")
            io.put_string(" 2 - AJouter %N")
            io.put_string("%N --- %N")
            io.put_string(" Choix : ")
            io.put_string("%N ****** %N%N")
        end
        
    afficher_erreur_saisie_menu is
        do
            io.put_string(" ***%N")
            io.put_string(" *** Le choix du menu ne correspond à aucune option%N")
            io.put_string(" ***%N%N")
        end
        
    afficher_sortie_programme is
        do
            io.put_string("================================%N")
            io.put_string("=== Au revoir et à bientôt ! ===%N")
            io.put_string("================================%N%N")
        end
end
