class LISTE_MEDIAS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des médias
    liste_medias: ARRAY[MEDIA]
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_media.make_empty
        end

    -- Ajouter
    ajouter_utilisateur is
        do

        end

    -- Modifier
    modifier_utilisateur is
        do

        end

    -- Rechercher
    rechercher_utilisateur:ARRAY[UTILISATEUR] is
        do

        end

    -- Get
    get_utilisateur:UTILISATEUR is
        do

        end
