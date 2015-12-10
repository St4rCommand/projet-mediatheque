class GESTIONNAIRE_MENUS

creation {ANY}
	lancement
	
feature {}
       gestionnaire_fichier_utilisateurs:GESTIONNAIRE_FICHIER_UTILISATEURS
       gestionnaire_fichier_medias:GESTIONNAIRE_FICHIER_MEDIAS
       gestionnaire_medias:GESTIONNAIRE_MEDIAS
       gestionnaire_utilisateurs:GESTIONNAIRE_UTILISATEURS
       affichage_menus:AFFICHAGE_MENUS
       utilisateur_connecte: UTILISATEUR

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
            fin: BOOLEAN
        do
            -- Affichage du lancement de l'application
            affichage_menus.afficher_lancement
            --choix_menu := choix_menu := affichage_menus.afficher_menu_principal
            fin := False
            
            from
            until fin
            loop
                if utilisateur_connecte = Void then
                    fin := menu_principal_non_connecte
                elseif utilisateur_connecte.is_admin then
                    fin := menu_principal_admin
                else
                    --fin := menu_principal_client
                end
            end
            
        end
        
    menu_principal_non_connecte: BOOLEAN is
        local
            choix_menu: INTEGER
        do
            choix_menu := -1
            
            from
            until choix_menu = 0 or utilisateur_connecte /= Void
            loop
                choix_menu := affichage_menus.afficher_menu_principal_non_connecte
                
                inspect choix_menu
                    when 1 then
						-- Sous menu offrant les fonctionnalités pour les non connectes
						connecter
						Result := False
                    when 2 then
                        -- Afficher les médias
                        gestionnaire_medias.rechercher_medias
                    when 0 then
                        -- Afficher la fin du programme
                        affichage_menus.afficher_sortie_programme
                        Result := True
                    else 
                        affichage_menus.afficher_erreur_saisie_menu
                end
            end
        end

    menu_principal_admin: BOOLEAN is
        local
            choix_menu: INTEGER
        do
            choix_menu := -1
            
            from
            until choix_menu = 0 or utilisateur_connecte = Void
            loop
                choix_menu := affichage_menus.afficher_menu_principal_admin
                
                inspect choix_menu
                
                	-- Lister les utilisateurs
                    when 1 then
						gestionnaire_utilisateurs.lister_utilisateurs
						
                    -- Consulter un utilisateur						
                    when 2 then
                        io.put_string(" Fonctionnalité a implémenté %N ")
                     
                    -- Ajouter un utilisateur    
                    when 3 then
                        gestionnaire_utilisateurs.ajouter_form_utilisateur
                    
                    -- Supprimer un utilisateur    
                    when 4 then
						io.put_string(" Fonctionnalité a implémenté %N ")
                        
                    -- lister les medias    
                    when 5 then
                        gestionnaire_medias.rechercher_medias
                    
                    -- Consulter un média    
                    when 6 then
                        io.put_string(" Fonctionnalité a implémenté %N ")
                        
                    -- Ajouter un media     
                    when 7 then
						io.put_string(" Fonctionnalité a implémenté %N ")
						
					-- Supprimer un media	
                    when 8 then
                        io.put_string(" Fonctionnalité a implémenté %N ")
                        
                    -- Modifier un média    
                    when 9 then
                        io.put_string(" Fonctionnalité a implémenté %N ")
                        
                    -- Emprunter    
                    when 10 then
                        io.put_string(" Fonctionnalité a implémenté %N ")
                        
                    -- deconnecter
                    when 0 then
                        deconnecter
                        Result := False                          
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
             --   choix_sous_menu := affichage_menus.afficher_menu_utilisateur
                
                inspect choix_sous_menu
                    when 1 then
                        -- Afficher les utilisateurs
						gestionnaire_utilisateurs.lister_utilisateurs
                    when 2 then
                        -- Ajouter un utilisateur
                        gestionnaire_utilisateurs.ajouter_form_utilisateur
                    when 0 then
                        -- Afficher le menu principal
                        affichage_menus.afficher_retour_menu_principal
                    else 
                        affichage_menus.afficher_erreur_saisie_menu
                end
            end
        end
feature {NONE}

    -- Se connecter
	connecter is
		local
			utilisateur : UTILISATEUR
			identifiant : STRING
		do
		    create identifiant.make_from_string(affichage_menus.saisir_identifiant)
		    utilisateur:= gestionnaire_utilisateurs.get_utilisateur(identifiant)
		    
		    if utilisateur /= Void then
		        utilisateur_connecte := utilisateur
	        else
	            affichage_menus.afficher_saisie_identifiant_incorrecte
            end
		end
		
	deconnecter is
	    do
	        utilisateur_connecte := Void
	    end
end
