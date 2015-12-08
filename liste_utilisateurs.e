class LISTE_UTILISATEURS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des UTILISATEURS
    liste_utilisateurs: ARRAY[UTILISATEUR]
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_utilisateurs.make(0,0)
        end

	-- Lister les utilisateurs		
	lister_utilisateurs:ARRAY[UTILISATEUR] is
    do
        Result := liste_utilisateurs
    end

    -- Ajouter
    ajouter_utilisateur(p_utilisateur: UTILISATEUR) is
        do
            liste_utilisateurs.add_last(p_utilisateur)
        end
        
    -- Ajouter une liste d'utilisateurs
    ajouter_utilisateurs(p_utilisateurs: ARRAY[UTILISATEUR]) is
        do
            liste_utilisateurs.append_collection(p_utilisateurs)
        end

        
end
