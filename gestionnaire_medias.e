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

    -- Ajouter des médias
    ajouter_medias(p_medias:ARRAY[MEDIA]) is
        do
            liste_medias.ajouter_medias(p_medias)
        end

    -- Ajouter un nouveau média
    --ajouter_media is
    --    do
    --
    --    end

    -- Rechercher un média dans la liste des médias proposés
    rechercher_medias is 
        local
            medias: ARRAY[MEDIA]
        do
            create medias.from_collection(liste_medias.rechercher_media)
            affichage_medias.afficher_medias(medias)
        end

    -- Modifier les caractéristiques d'un média
    --modifier_media is
    --    do
    --
    --    end

end
