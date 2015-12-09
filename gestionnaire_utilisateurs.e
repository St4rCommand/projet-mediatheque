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

    -- Ajouter un utilisateur avec en entrée l'utilisateur
    ajouter_utilisateur(p_utilisateur:UTILISATEUR) is
        do
            liste_utilisateurs.ajouter_utilisateur(p_utilisateur)
			affichage_utilisateurs.afficher_utilisateur(p_utilisateur)
			
        end
        
    -- Ajouter des utilisateurs
    ajouter_utilisateurs(p_utilisateurs:ARRAY[UTILISATEUR]) is
        do
            liste_utilisateurs.ajouter_utilisateurs(p_utilisateurs)
        end

	-- Formulaire de saisi pour un utilisateur
	formulaire_utilisateur:UTILISATEUR is
		local
			existe : BOOLEAN
			identifiant : STRING
			nom : STRING
			prenom : STRING
			p_utilisateur : UTILISATEUR
		do
			existe := True
			
			create nom.make_empty
			create prenom.make_empty
			create identifiant.make_empty
			
			-- demander de saisir l'identifiant
		    from
			until not existe
            loop
	      		identifiant.copy(affichage_utilisateurs.saisir_identifiant)
			    existe := liste_utilisateurs.existe_id(identifiant)
				--io.put_string("val : "+existe.to_string)
				if existe then
				    affichage_utilisateurs.afficher_identifiant_existe
				end
			 end

			-- saisir le nom
			nom.copy(affichage_utilisateurs.saisir_nom)

			-- saisir le prénom
			prenom.copy(affichage_utilisateurs.saisir_prenom)

			-- instancier l'utilisateur
			create p_utilisateur.nouveau(identifiant,nom,prenom)
			io.put_string(p_utilisateur.to_string)
			Result := p_utilisateur
		end	

	-- Ajouter un utilisateur par le formulaire rempli 
	ajouter_form_utilisateur is
		local
			utilisateur : UTILISATEUR
		do
		    affichage_utilisateurs.afficher_nouvel_utilisateur
		    
			utilisateur := formulaire_utilisateur
			liste_utilisateurs.ajouter_utilisateur(utilisateur)
			
			affichage_utilisateurs.afficher_nouvel_utilisateur_cree(utilisateur)
			affichage_utilisateurs.afficher_fin_nouvel_utilisateur
		end	
			
end
