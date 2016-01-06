class GESTIONNAIRE_MENUS

---
--- Gestionnaire des menus
---

creation {ANY}
	lancement
	
feature {NONE}

        
       gestionnaire_fichier_utilisateurs:GESTIONNAIRE_FICHIER_UTILISATEURS
       gestionnaire_fichier_medias:GESTIONNAIRE_FICHIER_MEDIAS
       gestionnaire_medias:GESTIONNAIRE_MEDIAS
       gestionnaire_utilisateurs:GESTIONNAIRE_UTILISATEURS
       gestionnaire_emprunts:GESTIONNAIRE_EMPRUNTS
       affichage_menus:AFFICHAGE_MENUS
       utilisateur_connecte: UTILISATEUR

feature {ANY}
	
	---
	--- Lancement de l'application
    lancement is
        local
            utilisateurs_lus: ARRAY[UTILISATEUR]
            medias_lus: ARRAY[MEDIA]
            nombre_emprunts_par_utilisateur: INTEGER
            delai_emprunt_media: INTEGER
        do
            -- Paramètre de l'application
            nombre_emprunts_par_utilisateur := 3
            delai_emprunt_media := 4
            
            -- Chargement des modules
            create gestionnaire_fichier_utilisateurs
            create gestionnaire_fichier_medias
            create gestionnaire_medias.nouveau
            create gestionnaire_utilisateurs.nouveau
            create gestionnaire_emprunts.nouveau(gestionnaire_utilisateurs,gestionnaire_medias, nombre_emprunts_par_utilisateur, delai_emprunt_media)
            create affichage_menus
            gestionnaire_medias.set_gestionnaire_emprunts(gestionnaire_emprunts)
            
            -- Chargement des médias depuis le fichier de données
            create medias_lus.from_collection(gestionnaire_fichier_medias.lire_fichier_medias("medias.txt"))
            gestionnaire_medias.ajouter_liste(medias_lus)
            
            -- Chargement des utilisateurs depuis le fichier de données
            create utilisateurs_lus.from_collection(gestionnaire_fichier_utilisateurs.lire_fichier_utilisateurs("utilisateurs.txt")) 
            gestionnaire_utilisateurs.ajouter_utilisateurs(utilisateurs_lus)
            
            -- Menu principal de l'application
            menu_principal
        end
    
    ---
    --- Gestion du menu principal de l'application
    menu_principal is
        local
            fin: BOOLEAN
        do
            fin := False
            
            -- Affichage du lancement de l'application
            affichage_menus.afficher_lancement

            from
            until fin
            loop
                -- Interface publique
                if utilisateur_connecte = Void then
                    fin := menu_principal_non_connecte
                -- Interface d'administration
                elseif utilisateur_connecte.is_admin then
                    fin := menu_principal_admin
                -- Interface client
                else
                    fin := menu_principal_client
                end
            end
            
        end
    
    ---
    --- Gestion du menu public de l'application
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
                        gestionnaire_medias.consulter
                    when 0 then
                        -- Afficher la fin du programme
                        affichage_menus.afficher_sortie_programme
                        Result := True
                    else 
                        affichage_menus.afficher_erreur_saisie_menu
                end
            end
        end
    
    ---
    --- Gestion du menu des administrateurs de l'application
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

					-- Consulter son compte
					when 1 then
						gestionnaire_utilisateurs.info_compte(utilisateur_connecte, gestionnaire_emprunts)
                
                	-- Lister les utilisateurs
                    when 2 then
						gestionnaire_utilisateurs.lister_utilisateurs
						
                    -- Consulter un utilisateur						
                    when 3 then
                        gestionnaire_utilisateurs.consulter
                     
                    -- Ajouter un utilisateur    
                    when 4 then
                        gestionnaire_utilisateurs.ajouter_form_utilisateur
                    
                    -- Supprimer un utilisateur    
                    when 5 then
                        gestionnaire_utilisateurs.supprimer(gestionnaire_emprunts,utilisateur_connecte)
                        
                    -- lister les medias    
                    when 6 then
                        gestionnaire_medias.consulter
                        
                    -- Ajouter un media     
                    when 7 then
                        gestionnaire_medias.ajouter
                        
                    -- Modifier un média    
                    when 8 then
                        gestionnaire_medias.mettre_a_jour
                        
                    -- Emprunter    
                    when 9 then
                        gestionnaire_emprunts.ajouter
                        
                    -- Retour d'emprunt    
                    when 10 then
                        gestionnaire_emprunts.rendre

					-- Emprunts non rendus à la date fixée
					when 11 then
						gestionnaire_emprunts.delais_depasse
                        
                    -- deconnecter
                    when 0 then
                        deconnecter
                        Result := False                          
                    else 
                        affichage_menus.afficher_erreur_saisie_menu
                end
            end
        end
    
    ---    
    --- Gestion du menu des clients de l'application
    menu_principal_client: BOOLEAN is
        local
            choix_menu: INTEGER
        do
            choix_menu := -1
            
            from
            until choix_menu = 0 or utilisateur_connecte = Void
            loop
                choix_menu := affichage_menus.afficher_menu_principal_client
                
                inspect choix_menu
                
                	-- Consulter les informations de son compte
                    when 1 then
						gestionnaire_utilisateurs.info_compte(utilisateur_connecte, gestionnaire_emprunts)
                        
                    -- lister les medias    
                    when 2 then
                        gestionnaire_medias.consulter
                        
                    -- Réserver un média
                    --when 10 then
                    --    io.put_string(" Fonctionnalité à implémenter %N ")
                        
                    -- deconnecter
                    when 0 then
                        deconnecter
                        Result := False                          
                    else 
                        affichage_menus.afficher_erreur_saisie_menu
                end
            end
        end
        
feature {NONE}

    ---
    --- Gestion de la connection à l'application
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
		
	---
	--- Gestion de la deconnexion de l'application
	deconnecter is
	    do
	        utilisateur_connecte := Void
	    end
end
