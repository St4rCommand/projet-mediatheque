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
    
    -- 
    ajouter is
        local
        do
        end

    -- Rechercher un média dans la liste des médias proposés
    consulter is 
        local
            medias: ARRAY[MEDIA]
            choix_recherche: INTEGER
            
        do
            create medias.from_collection(liste_medias.rechercher_media)
            affichage_medias.afficher_menu_recherche
            affichage_medias.afficher_menu_recherche_type
            choix_recherche := affichage_medias.saisir_choix_menu
            
            inspect choix_recherche
                when 1 then
                    --rechercher_livres
                when 2 then
                    --rechercher_dvd
                when 3 then
                    --rechercher_medias
            end
            
            affichage_medias.afficher_medias(medias)
            
        end
        
    modifier is
        local
        do
        end
        
feature {NONE}

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
