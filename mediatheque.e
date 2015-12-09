class MEDIATHEQUE

creation {ANY}
	lancement
	
feature {}
       gestionnaire_fichier_utilisateurs:GESTIONNAIRE_FICHIER_UTILISATEURS
       gestionnaire_fichier_medias:GESTIONNAIRE_FICHIER_MEDIAS
       gestionnaire_medias:GESTIONNAIRE_MEDIAS
       gestionnaire_utilisateurs:GESTIONNAIRE_UTILISATEURS
       affichage_menus:AFFICHAGE_MENUS

feature {ANY}
	
	-- Lancement de l'application
    lancement is
        local
            utilisateurs_lus: ARRAY[UTILISATEUR]
            medias_lus: ARRAY[MEDIA]
        do
            -- Chargement des gestionnaires
            create gestionnaire_fichier_utilisateurs
            create gestionnaire_fichier_medias
            create gestionnaire_medias.nouveau
            create gestionnaire_utilisateurs.nouveau
            create affichage_menus
            
            -- Chargement des médias depuis le fichier de données
            create medias_lus.from_collection(gestionnaire_fichier_medias.lire_fichier_medias("medias.txt"))
            gestionnaire_medias.ajouter_medias(medias_lus)
            
            -- Chargement des utilisateurs depuis le fichier de données
            create utilisateurs_lus.from_collection(gestionnaire_fichier_utilisateurs.lire_fichier_utilisateurs("utilisateurs.txt")) 
            gestionnaire_utilisateurs.ajouter_utilisateurs(utilisateurs_lus)
            
            -- Menu principal
            menu_principal
        end
    
    -- Menu principal de l'application
    menu_principal is
        local
            choix_menu: INTEGER
        do
            -- Affichage du lancement de l'application
            affichage_menus.afficher_lancement
            
            choix_menu := -1
            
            from
            until choix_menu = 0
            loop
                choix_menu := affichage_menus.afficher_menu_principal
                
                inspect choix_menu
                    when 1 then
						-- Sous menu offrant les fonctionnalités
						sous_menu_utilisateur
                        -- Afficher les utilisateurs
						--gestionnaire_utilisateurs.lister_utilisateurs
                        --gestionnaire_utilisateurs.rechercher_medias
                       -- io.put_string(" ***%N")
                        --io.put_string(" *** Vous avez choisi les utilisateurs, fonctionnalités à implémenter%N")
                        --io.put_string(" ***%N%N")
                    when 2 then
                        -- Afficher les médias
                        gestionnaire_medias.rechercher_medias
                    when 0 then
                        -- Afficher la fin du programme
                        affichage_menus.afficher_sortie_programme
                    else 
                        affichage_menus.afficher_erreur_saisie_menu
                end
            end
        end

    -- Sous menu des fonctionnalités concernant l'admin
    sous_menu_utilisateur is
        local
			choix_sous_menu: INTEGER
        do            
            choix_sous_menu := -1
            
            from
            until choix_sous_menu = 0
            loop
                choix_sous_menu := affichage_menus.afficher_menu_utilisateur
                
                inspect choix_sous_menu
                    when 1 then
                        -- Afficher les utilisateurs
						gestionnaire_utilisateurs.lister_utilisateurs
                    when 2 then
                        -- Ajouter un utilisateur
                        gestionnaire_utilisateurs.ajouter_form_utilisateur
                    when 0 then
                        -- Afficher le menu principal
                        menu_principal
                    else 
                        affichage_menus.afficher_erreur_saisie_menu
                end
            end
        end

end
