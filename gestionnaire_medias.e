class GESTIONNAIRE_MEDIAS

creation {ANY}
    nouveau

feature {NONE}

    -- Liste des médias
    liste_medias: LISTE_MEDIAS

    -- Affichage des médias
    affichage_medias: AFFICHAGE_MEDIAS
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_medias.nouveau
            create affichage_medias
        end

    -- Ajouter des médias dans la liste existante
    ajouter_liste(p_medias:ARRAY[MEDIA]) is
        do
            liste_medias.ajouter_liste(p_medias)
        end
    
    -- Ajouter un média
    ajouter is
        local
        do
        end

    -- Rechercher un média dans la liste des médias proposés
    consulter is 
        local
            medias: ARRAY[MEDIA]
            choix_consultation: INTEGER
            choix_continuer: INTEGER
        do
            choix_consultation := -1
            choix_continuer := -1
            create medias.make(0,0)
        
            -- Rechercher jusqu'à fin
            from
            until choix_continuer = 0
            loop
                choix_continuer := -1
            
                -- Rechercher un média                
                medias.copy(rechercher)
                
                -- Consulter un média jusqu'à fin ou nouvelle recherche
                from
                until medias /= Void and (choix_continuer = 0 or choix_continuer = 1)
                loop
                
                    affichage_medias.afficher_recherche_resultats(medias)
                    choix_consultation := affichage_medias.saisir_media_selectionne(medias.count)
                    
                    if choix_consultation = 0 then
                        choix_continuer := 1 
                    else
                        affichage_medias.afficher_media(medias.item(choix_consultation))

                        -- Séléctionner action suivante
                        affichage_medias.afficher_consultation_suivante
                        choix_continuer := affichage_medias.saisir_choix_menu(2)
                    end
                end
            end
            
        end
        
    modifier is
        local
        do
        end
        
feature {NONE}

            
    rechercher: ARRAY[MEDIA] is
        local
            choix_recherche: INTEGER
        do
            choix_recherche := -1
        
            affichage_medias.afficher_recherche_debut
            
            affichage_medias.afficher_recherche_menu_type
            choix_recherche := affichage_medias.saisir_choix_menu(3)
            
            inspect choix_recherche
                when 1 then
                    Result := rechercher_livres
                when 2 then
                    Result := rechercher_dvd
                when 3 then
                    Result := rechercher_medias
                when 0 then
                    Result := Void
            end
            
            affichage_medias.afficher_recherche_fin
            
        end
        
    rechercher_dvd: ARRAY[MEDIA] is
        local
        do
            io.put_string("Rechercher dvd : à faire !")
            Result := liste_medias.rechercher_media
        end
    
    rechercher_livres: ARRAY[MEDIA] is
        local
        do
            io.put_string("Rechercher dvd : à faire !")
            Result := liste_medias.rechercher_media
        end
    
    rechercher_medias: ARRAY[MEDIA] is
        local
        do
            io.put_string("Rechercher dvd : à faire !")
            Result := liste_medias.rechercher_media
        end

    creer_dvd is
        local
        do
        end
        
    creer_livre is
        local
        do
        end
        
    creer_media is
        local
        do
        end
end
