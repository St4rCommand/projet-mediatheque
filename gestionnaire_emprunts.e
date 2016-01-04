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
    
    nombre_emprunts_par_utilisateur: INTEGER
    
feature {ANY}

    nouveau(p_gestionnaire_utilisateurs: GESTIONNAIRE_UTILISATEURS ; p_gestionnaire_medias: GESTIONNAIRE_MEDIAS ; p_nombre_emprunts_par_utilisateur: INTEGER) is
        do
            create liste_emprunts.nouveau
            create affichage_emprunts
            gestionnaire_utilisateurs := p_gestionnaire_utilisateurs
            gestionnaire_medias := p_gestionnaire_medias
            nombre_emprunts_par_utilisateur := p_nombre_emprunts_par_utilisateur
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
            nombre_emprunts: INTEGER
        do
            create emprunts.make(0,0)
            autre_emprunt := True
                 
            from
            until not autre_emprunt
            loop
                autre_media := True
                
                affichage_emprunts.afficher_nouvel_emprunt
                
                utilisateur := gestionnaire_utilisateurs.rechercher_utilisateur
                
                if utilisateur /= Void then
                    nombre_emprunts := liste_emprunts.nombre_emprunts(utilisateur)
                    
                    from
                    until not autre_media and nombre_emprunts /= nombre_emprunts_par_utilisateur
                    loop
                        io.put_string(nombre_emprunts.to_string+"%N")
                        media := gestionnaire_medias.rechercher_media
                        
                        if media /= Void then
                            create emprunt.nouveau(utilisateur,media)
                            emprunts.add_last(emprunt)
                        
                            nombre_emprunts := nombre_emprunts + 1
                        end
                        
                        affichage_emprunts.afficher_ajouter_autre_media
                        choix_menu := affichage_emprunts.saisir_choix_menu(2)
                        
                        if choix_menu = 0 then
                            autre_media := False
                        end
                        
                    end
                    
                    if nombre_emprunts = nombre_emprunts_par_utilisateur then
                        affichage_emprunts.afficher_limite_emprunts_atteinte
                    end
                    
                    if emprunts.count > 1 then
                        affichage_emprunts.afficher_emprunts(emprunts)
                        liste_emprunts.ajouter_liste(emprunts)
                    end
                    
                end
                
                
                affichage_emprunts.afficher_ajouter_autre_emprunt
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
