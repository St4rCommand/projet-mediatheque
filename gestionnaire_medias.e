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
    ajouter_medias(p_medias:ARRAY[MEDIA]) is
        do
            liste_medias.ajouter_medias(p_medias)
        end

    -- Rechercher un média dans la liste des médias proposés
    rechercher_medias is 
        local
            medias: ARRAY[MEDIA]
            choix_recherche: INTEGER
            
        do
            create medias.from_collection(liste_medias.rechercher_media)
            choix_recherche := affichage_medias.afficher_menu_recherche
            
            inspect choix_recherche
                when 1 then
                    --rechercher_livres
                when 2 then
                    --rechercher_dvd
                when 3 then
                    --rechercher_medias
            end
            
            affichage_medias.afficher_resultats_recherche(medias)
            
        end
        
feature {NONE}

end
