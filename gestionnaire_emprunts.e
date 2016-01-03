class GESTIONNAIRE_EMPRUNTS

creation {ANY}
    nouveau
    
feature {NONE}

    -- Liste des médias
    liste_emprunts: LISTE_EMPRUNTS

    -- Affichage des médias
    affichage_emprunts: AFFICHAGE_EMPRUNTS
    
feature {ANY}

    nouveau is
        do
            create liste_emprunts.nouveau
            create affichage_emprunts
        end
   
    ajouter is
        local
            emprunts: ARRAY[EMPRUNT]
            emprunt: EMPRUNT
        do
            create emprunts.make(0,0)
            autre_emprunt := True
            
            from
            until not autre_emprunt
            loop
                autre_media := True
                
                utilisateur := gestionnaire_utilisateurs.rechercher
                
                if utilisateurs /= Void and utilisateurs.count > 1 then
			        from 
			        until not autre_consultation
			        loop

			            -- Afficher résultat
			            affichage_utilisateurs.afficher_recherche_resultats(utilisateurs)
			
			            -- Choix de l'utilisateur a consulter
			            choix_menu := affichage_utilisateurs.saisir_utilisateur_selectionne(utilisateurs.count-1)
			            
			            if choix_menu = 0 then
			                autre_consultation := False
		                else
		                     affichage_utilisateurs.afficher_utilisateur(utilisateurs.item(choix_menu))
		                     
		                     affichage_utilisateurs.afficher_consultation_suivante
		                     choix_menu := affichage_utilisateurs.saisir_choix_menu(2)
		                     
		                     inspect choix_menu
                                when 1 then
                                    autre_media := False
                                when 2 then
                                when 0 then
                                    autre_media := False
                                    autre_emprunt := False
                            end
                        end
			        
			        end
                else
                    
                    if utilisateurs /= Void then
                        affichage_utilisateurs.afficher_recherche_incorrecte
                    else
                        autre_recherche := False
                    end
                end
            end
        
        end
        
    rendre is
        do
        
        end   
feature {NONE}

    rechercher_utilisateur: UTILISATEUR is
        local
        do
        end
        
    rechercher_media: MEDIA is
        local
        do
        end    
end
