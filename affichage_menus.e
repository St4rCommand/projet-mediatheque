class AFFICHAGE_MENUS
	
feature {ANY}
    
    afficher_lancement is
        do
            io.put_string("==================================%N")
            io.put_string("=== Bienvenue à la médiathèque ===%N")
            io.put_string("==================================%N")
        end
        
    afficher_menu_principal is
        do
            io.put_string(" *** Menu principal *** %N%N")
            io.put_string(" 1 - Utilisateurs %N")
            io.put_string(" 2 - Médias%N")
            io.put_string("%N%N --- %N")
            io.put_string("Choix : ")
            io.put_string("%N%N ****** %N%N")
        end
        
    afficher_menu_medias is
        do
            io.put_string(" *** Menu utilisateurs *** %N")
            io.put_string(" 1 - Afficher tous%N")
            io.put_string(" 2 - Rechercher%N")
            io.put_string(" --- %N%N")
            io.put_string("Choix : ")
            io.put_string(" ****** %N%N")
        end
	afficher_menu_admin is
        do
            io.put_string(" *** Menu admin *** %N")
            io.put_string(" 1 - Afficher tous %N")
            io.put_string(" 2 - AJouter %N")
            io.put_string(" --- %N%N")
            io.put_string("Choix : ")
            io.put_string(" ****** %N%N")
        end
end
