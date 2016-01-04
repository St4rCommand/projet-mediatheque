class GESTIONNAIRE_EMPRUNTS

creation {ANY}
    nouveau
    
feature {NONE}

    -- Liste des médias
    liste_emprunts: LISTE_EMPRUNTS

    -- Affichage des médias
    affichage_emprunts: AFFICHAGE_EMPRUNTS
    
    gestionnaire_utilisateurs: GESTIONNAIRE_UTILISATEURS
    
    gestionnaire_medias: GESTIONNAIRE_MEDIAS
    
feature {ANY}

    nouveau(p_gestionnaire_utilisateurs: GESTIONNAIRE_UTILISATEURS ; p_gestionnaire_medias: GESTIONNAIRE_MEDIAS) is
        do
            create liste_emprunts.nouveau
            create affichage_emprunts
            gestionnaire_utilisateurs := p_gestionnaire_utilisateurs
            gestionnaire_medias := p_gestionnaire_medias
        end
   
    ajouter is
        local
            emprunts: ARRAY[EMPRUNT]
            emprunt: EMPRUNT
            utilisateur: UTILISATEUR
            media: MEDIA
            autre_emprunt: BOOLEAN
            autre_media: BOOLEAN
            choix_menu: INTEGER
        do
            create emprunts.make(0,0)
            autre_emprunt := True
            
            -- vérifier le nombre de nouveaux emprunts que l'utilisateur peut faire
                 
            from
            until not autre_emprunt
            loop
                autre_media := True
                
                affichage_emprunts.afficher_nouvel_emprunt
                
                utilisateur := gestionnaire_utilisateurs.rechercher_utilisateur
                
                from
                until not autre_media 
                loop
                    media := gestionnaire_medias.rechercher_media
                    
                    create emprunt.nouveau(utilisateur,media)
                    emprunts.add_last(emprunt)
                    
                    affichage_emprunts.afficher_continuer
                    choix_menu := affichage_emprunts.saisir_choix_menu(2)
                    
                    if choix_menu = 0 then
                        autre_media := False
                    end
                    
                end
                
                affichage_emprunts.afficher_emprunts(emprunts)
                
                liste_emprunts.ajouter_liste(emprunts)
                
                
                affichage_emprunts.afficher_continuer
                choix_menu := affichage_emprunts.saisir_choix_menu(2)
                
                if choix_menu = 0 then
                    autre_emprunt := False
                end
            end
        
        end
        
    rendre is
        do
        
        end
        
         
feature {NONE}

    
        
    rechercher_media: MEDIA is
        local
        do
        end    
end
