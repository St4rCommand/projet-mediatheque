class GESTIONNAIRE_UTILISATEURS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des médias
    liste_utilisateurs: LISTE_UTILISATEURS

    -- Affichage des médias
    affichage_utilisateurs: AFFICHAGE_UTILISATEURS
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_utilisateurs.nouveau
            create affichage_utilisateurs
        end

    -- Lister les utilisateurs
    lister_utilisateurs is
       local
            utilisateurs: ARRAY[UTILISATEUR]
        do
            create utilisateurs.from_collection(liste_utilisateurs.lister_utilisateurs)
            affichage_utilisateurs.afficher_utilisateurs(utilisateurs)
        end

    -- Ajouter un utilisateur
    ajouter_utilisateur(p_utilisateur:UTILISATEUR) is
        do
            liste_utilisateurs.ajouter_utilisateur(p_utilisateur)
			affichage_utilisateurs.afficher_utilisateur(p_utilisateur)
			
			-- from
			-- until unique
			-- loop
			--      unique = liste_utilisateurs.existe(identifiant):boolen
			--      afficage_menu.saisir identiifant
			-- end
			
			--gestionnaire_menu.afficher_menu_admin
        end
        
    -- Ajouter des utilisateurs
    ajouter_utilisateurs(p_utilisateurs:ARRAY[UTILISATEUR]) is
        do
            liste_utilisateurs.ajouter_utilisateurs(p_utilisateurs)
        end

    -- Rechercher un utilisateur
--    rechercher_utilisateur is 
  --      local
            
   --     do
            
    --    end


    -- Modifier le compte utilisateur
    --modifier_utilisateur is
    --    do
    --
    --    end

end
