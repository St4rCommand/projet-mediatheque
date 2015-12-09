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
			-- demander de saisir l'identifiant
			io.put_string("valeur booleen : "+existe.to_string)
			 from
			 until existe
			 loop
	      		identifiant := affichage_utilisateurs.saisir_identifiant
			    existe := liste_utilisateurs.existe_id(identifiant)
				io.put_string("val : "+existe.to_string)
				if existe then
					io.put_string("Identifiant déjà connu %N")
				end
			 end

			-- saisir le nom
			nom := affichage_utilisateurs.saisir_nom

			-- saisir le prénom
			prenom := affichage_utilisateurs.saisir_prenom

			-- instancier l'utilisateur
			create p_utilisateur.nouveau(identifiant,nom,prenom)
			Result := p_utilisateur
		end	

	-- Ajouter un utilisateur par le formulaire rempli 
	ajouter_form_utilisateur is
		local
			utilisateur : UTILISATEUR
		do
			utilisateur := formulaire_utilisateur
			liste_utilisateurs.ajouter_utilisateur(utilisateur)
			io.put_string ("utilisateur crée ! ") 
		end	
			
end
