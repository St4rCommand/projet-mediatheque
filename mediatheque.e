class MEDIATHEQUE

creation {ANY}
	lancement
	
feature {}
       gestionnaire_fichier_utilisateurs:GESTIONNAIRE_FICHIER_UTILISATEURS
       gestionnaire_fichier_medias:GESTIONNAIRE_FICHIER_MEDIAS
       gestionnaire_medias:GESTIONNAIRE_MEDIAS
       --gestionnaire_medias:GESTIONNAORE_UTILISATEURS
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
            --create gestionnaire_utilisateurs
            create affichage_menus
            
            -- Chargement des médias depuis le fichier de données
            create medias_lus.from_collection(gestionnaire_fichier_medias.lire_fichier_medias("medias.txt"))
            gestionnaire_medias.ajouter_medias(medias_lus)
            
            -- Chargement des utilisateurs depuis le fichier de données
            create utilisateurs_lus.from_collection(gestionnaire_fichier_utilisateurs.lire_fichier_utilisateurs("utilisateurs.txt")) 
            --gestionnaire_utilisateurs.ajouter_utilisateurs(utilisateurs_lus)
            
            -- Menu principal
            menu_principal
        end
    
    -- Menu principal de l'application
    menu_principal is
        local
            --choix_menu: INTEGER
        do
            -- Affichage du lancement de l'application
            affichage_menus.afficher_lancement
            
            affichage_menus.afficher_menu_principal
            
            -- Afficher les médias
            gestionnaire_medias.rechercher_medias
        end

end
