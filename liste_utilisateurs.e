class LISTE_UTILISATEURS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des UTILISATEURS
    liste_utilisateurs: ARRAY[UTILISATEURS]
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_utilisateurs.make(0,0)
        end

    -- Ajouter
    ajouter_utilisateur(p_utilisateur: UTILISATEUR) is
        do
            liste_utilisateurs.add_last(p_utilisateur)
        end

        
end
