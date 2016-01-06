class GESTIONNAIRE_EMPRUNTS

---
--- Gestionnaire des emprunts
---

creation {ANY}
    nouveau
    
feature {NONE}

    -- Liste des médias
    liste_emprunts: LISTE_EMPRUNTS

    -- Affichage des médias
    affichage_emprunts: AFFICHAGE_EMPRUNTS
    
    -- Gestionnaire des utilisateurs
    gestionnaire_utilisateurs: GESTIONNAIRE_UTILISATEURS
    
    -- Gestionnaire des médias
    gestionnaire_medias: GESTIONNAIRE_MEDIAS
    
    -- Nombre d'emprunts maximum par utilisateur
    nombre_emprunts_par_utilisateur: INTEGER
    
    -- Délai maximum d'un emprunt (en semaines)
    delai_emprunt_media: INTEGER
    
feature {ANY}

    nouveau(p_gestionnaire_utilisateurs: GESTIONNAIRE_UTILISATEURS ; p_gestionnaire_medias: GESTIONNAIRE_MEDIAS ; p_nombre_emprunts_par_utilisateur: INTEGER ; p_delai_emprunt_media: INTEGER) is
        require
            p_delai_emprunt_media > 0
        do
            create liste_emprunts.nouveau(delai_emprunt_media)
            create affichage_emprunts.nouveau(p_delai_emprunt_media)
            gestionnaire_utilisateurs := p_gestionnaire_utilisateurs
            gestionnaire_medias := p_gestionnaire_medias
            nombre_emprunts_par_utilisateur := p_nombre_emprunts_par_utilisateur
            delai_emprunt_media := p_delai_emprunt_media
        ensure
            delai_emprunt_media > 0
        end
   
    ---
    --- Créer un emprunt
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
--            date_emprunt.add_day(7*4)
            autre_emprunt := True
                 
            from
            until not autre_emprunt
            loop
                autre_media := True
                
                affichage_emprunts.afficher_nouvel_emprunt
                
                -- Sélection de l'utilisateur
                utilisateur := gestionnaire_utilisateurs.rechercher_utilisateur
                
                if utilisateur /= Void then
                    
                    -- Récupération du nombre d'emprunts déjà effectués par cet utilisateur
                    nombre_emprunts := liste_emprunts.nombre_emprunts(utilisateur)
                    
                    -- Sélection des médias
                    from
                    until not autre_media or nombre_emprunts = nombre_emprunts_par_utilisateur
                    loop
                        media := gestionnaire_medias.rechercher_media
                        
                        if media /= Void then
                            
                            if liste_emprunts.is_empruntable(media) then
                                create emprunt.nouveau(utilisateur,media,date_emprunt)
                                
                                liste_emprunts.ajouter(emprunt)
                                emprunts.add_last(emprunt)
                            
                                nombre_emprunts := nombre_emprunts + 1
                            else
                                affichage_emprunts.afficher_media_indisponible
                            end
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
                    end
                    
                end
                
                
                affichage_emprunts.afficher_ajouter_autre_emprunt
                choix_menu := affichage_emprunts.saisir_choix_menu(2)
                
                if choix_menu = 0 then
                    autre_emprunt := False
                end
            end
        
        end
    
    ---
    --- Rendre un média suite à un emprunt
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
                
                -- Sélection de l'utilisateur
                utilisateur := gestionnaire_utilisateurs.rechercher_utilisateur
                
                if utilisateur /= Void then
                
                    -- Recherche des emprunts de l'utilisateur
                    emprunts := liste_emprunts.rechercher_emprunt(utilisateur)
                    
                    -- Sélection du ou des emprunts à supprimer
                    from
                    until not autre_emprunt
                    loop
                    
                        affichage_emprunts.afficher_emprunts_liste(emprunts)
                        choix_menu := affichage_emprunts.saisir_resultat_a_selectionne(emprunts.count-1)
                        
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
        
    ---
    --- Récuperer et afficher les emprunts de l'utilisateur
    emprunts_utilisateur(p_utilisateur:UTILISATEUR) is
        local
            emprunts: ARRAY[EMPRUNT]
        do
            create emprunts.make(0,0)
            
            -- Récupération des emprunts de l'utilisateur
            emprunts := liste_emprunts.rechercher_emprunt(p_utilisateur)
            
            if emprunts.count > 1 then
	    		-- affichage des emprunts
	    		affichage_emprunts.afficher_details_emprunts(emprunts)
			else
                affichage_emprunts.afficher_aucun_emprunt_utilisateur
            end
        end
    
    ---
    --- Récupérer le nombre d'emprunts de l'utilisateur
    get_nombre_emprunts(p_utilisateur : UTILISATEUR): INTEGER is
        do
            Result := liste_emprunts.nombre_emprunts(p_utilisateur)
        end
        
    ---
    --- Récupérer le nombre d'emprunts d'un média
    get_nombre_emprunts_media(p_media: MEDIA): INTEGER is
        do
            Result := liste_emprunts.nb_exemplaire_emprunte(p_media)
        end

    ---
    --- Récuperer et afficher les emprunts dont la date de rendu est dépassée
	delais_depasse is
		local
			emprunts_depasses : ARRAY[EMPRUNT]
		do
			create emprunts_depasses.make(0,0)
			affichage_emprunts.afficher_retard_debut
			emprunts_depasses := liste_emprunts.delais_depasse
			
			if emprunts_depasses.count > 1 then
    			affichage_emprunts.afficher_emprunts(emprunts_depasses)
			else
			    affichage_emprunts.afficher_aucun_retard
		    end
			
		end
end
