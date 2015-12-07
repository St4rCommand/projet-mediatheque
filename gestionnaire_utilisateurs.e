class UTILISATEUR

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des médias
    liste_utilisateurs: LISTE_UTILISATEURS

    -- Affichage des médias
    affichage_utilisateur: AFFICHAGE_UTILISATEURS
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_utilisateurs.make_empty
        end

    -- 

    -- Ajouter un utilisateur
    ajouter_utilisateur is
        do

        end

    -- Rechercher un utilisateur dans la liste des utilisateurs
    rechercher_utilisateur is
        do

        end

    -- Modifier le compte de l'utilisateur
    modifier_utilisateur is
        do
        -- Appel la fonction rechercher utilisateur
        -- Affichage de l'utilisateur
        -- Appel focntion modifier (parametre à changer)
        -- Affichage modification
        -- Menu principal

        end


