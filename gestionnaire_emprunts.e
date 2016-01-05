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
    
    delai_emprunt_media: INTEGER
    
feature {ANY}

    nouveau(p_gestionnaire_utilisateurs: GESTIONNAIRE_UTILISATEURS ; p_gestionnaire_medias: GESTIONNAIRE_MEDIAS ; p_nombre_emprunts_par_utilisateur: INTEGER ; p_delai_emprunt_media: INTEGER) is
        do
            create liste_emprunts.nouveau
            create affichage_emprunts.nouveau(p_delai_emprunt_media)
            gestionnaire_utilisateurs := p_gestionnaire_utilisateurs
            gestionnaire_medias := p_gestionnaire_medias
            nombre_emprunts_par_utilisateur := p_nombre_emprunts_par_utilisateur
            delai_emprunt_media := p_delai_emprunt_media
        end
   
   -- vérifier que le média peut encore être emprunté
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
            date_emprunt : TIME
        do
            create emprunts.make(0,0)
            create date_emprunt
            date_emprunt.update
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
                    until not autre_media or nombre_emprunts = nombre_emprunts_par_utilisateur
                    loop
                        media := gestionnaire_medias.rechercher_media
                        
                        if media /= Void then
                            create emprunt.nouveau(utilisateur,media,date_emprunt)
                            
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
        local
            emprunts: ARRAY[EMPRUNT]
            utilisateur: UTILISATEUR
            autre_rendu: BOOLEAN
            autre_emprunt: BOOLEAN
            choix_menu: INTEGER
        do
            create emprunts.make(0,0)
            autre_rendu := True
                 
            from
            until not autre_rendu
            loop
                autre_emprunt := True
                
                affichage_emprunts.afficher_nouveau_rendu
                
                utilisateur := gestionnaire_utilisateurs.rechercher_utilisateur
                
                if utilisateur /= Void then
                
                    emprunts := liste_emprunts.rechercher_emprunt(utilisateur)
                    
                    from
                    until not autre_emprunt
                    loop
                    
                        affichage_emprunts.afficher_emprunts(emprunts)
                        choix_menu := affichage_emprunts.saisir_emprunt_selectionne(emprunts.count-1)
                        
                        if choix_menu = 0 then
                            autre_emprunt := False
                        else
                            liste_emprunts.supprimer(emprunts.item(choix_menu))
                            emprunts.remove(choix_menu)
                        end
                        
                        if emprunts.count = 1 then
                            affichage_emprunts.afficher_aucun_emprunt
                            autre_emprunt := False
                        else
                            affichage_emprunts.afficher_supprimer_autre_emprunt
                            choix_menu := affichage_emprunts.saisir_choix_menu(2)
                            
                            if choix_menu = 0 then
                                autre_emprunt := False
                            end
                        end
                        
                    end
                    
                end
                
                
                affichage_emprunts.afficher_autre_rendu
                choix_menu := affichage_emprunts.saisir_choix_menu(2)
                
                if choix_menu = 0 then
                    autre_rendu := False
                end
            end
        
        end
        
    emprunts_utilisateur(p_utilisateur:UTILISATEUR) is 
        do
			-- affichage des emprunts
			affichage_emprunts.afficher_details_emprunts(liste_emprunts.rechercher_emprunt(p_utilisateur))
        end
        
    get_nombre_emprunts(p_utilisateur : UTILISATEUR): INTEGER is
        do
            Result := liste_emprunts.nombre_emprunts(p_utilisateur)
        end
         
feature {NONE}

    
        
    rechercher_media: MEDIA is
        local
        do
        end    
end
