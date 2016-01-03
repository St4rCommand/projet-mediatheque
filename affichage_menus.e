class AFFICHAGE_MENUS
	
feature {ANY}
    
    -- Message de bienvenue
    afficher_lancement is
        do
            io.put_string("==================================%N")
            io.put_string("=== Bienvenue à la médiathèque ===%N")
            io.put_string("==================================%N%N")
        end
        
    -- Afficher le menu pour les non connectés    
    afficher_menu_principal_non_connecte: INTEGER is
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
        
        

        
--	afficher_menu_utilisateur:INTEGER is
    
    -- Afficher le menu des admins    
	afficher_menu_principal_admin:INTEGER is
         local
            choix_sous_menu:STRING
        do
            choix_sous_menu := ""
        
            io.put_string(" *** Menu admin *** %N%N")
            io.put_string("%N --- Utilisateurs --- %N")
            io.put_string(" 1 - Lister les utilisateurs%N")
            io.put_string(" 2 - Consulter un utilisateur%N")
            io.put_string(" 3 - Ajouter un utilisateur%N")
            io.put_string(" 4 - Supprimer un utilisateur%N")
            io.put_string("%N --- Medias --- %N")
            io.put_string(" 5 - Consulter un média%N")
            io.put_string(" 6 - Ajouter un media%N")
            io.put_string(" 7 - Modifier un média%N")
            io.put_string("%N --- Emprunts --- %N")
            io.put_string(" 8 - Effectuer un emprunt%N")
            io.put_string(" 9 - Rendre des medias%N")                                   
            io.put_string("%N 0 - Se deconnecter%N")
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
        
    afficher_menu_principal_client:INTEGER is
         local
            choix_sous_menu:STRING
        do
            choix_sous_menu := ""
        
            io.put_string(" *** Menu client *** %N%N")
            io.put_string(" 1 - Consulter mon compte%N")
            io.put_string(" 2 - Lister les médias%N")
            io.put_string(" 3 - Consulter un média%N")                               
            io.put_string("%N 0 - Se deconnecter%N")
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
            afficher_message_erreur("Le choix du menu ne correspond à aucune option")
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
            io.put_string(" *** Connexion *** %N%N")
            io.put_string(" Saisir un identifiant : ")
            io.read_line
            identifiant := io.last_string
            
            Result := identifiant
            io.put_string("%N ****** %N%N")
        end
        
    afficher_saisie_identifiant_incorrecte is
        do
            afficher_message_erreur("Aucun utilisateur ne correspond à cet identifiant")
        end
        
    afficher_menu_medias: INTEGER is
        local
            choix_menu:STRING
        do
            choix_menu := ""
        
            io.put_string(" *** Accueil *** %N%N")
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
        
feature {NONE}

    afficher_message_erreur(p_string: STRING) is
        do
            io.put_string(" ***%N")
            io.put_string(" *** "+p_string+"%N")
            io.put_string(" ***%N%N")
        end
end
