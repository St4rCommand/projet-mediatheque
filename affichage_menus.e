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
            io.put_string(" *** Menu principal *** %N")
            io.put_string(" 1 - Utilisateurs %N")
            io.put_string(" 2 - Médias%N")
            io.put_string(" --- %N%N")
            io.put_string("Choix : ")
        end
        
    afficher_menu_medias is
        do
            io.put_string(" *** Menu utilisateurs *** %N")
            io.put_string(" 1 - Afficher tous%N")
            io.put_string(" 2 - Rechercher%N")
            io.put_string(" --- %N%N")
            io.put_string("Choix : ")
        end
end
