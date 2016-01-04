class GESTIONNAIRE_UTILISATEURS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des utilisateurs
    liste_utilisateurs: LISTE_UTILISATEURS

    -- Affichage des utilisateurs
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
            liste_utilisateurs.ajouter(p_utilisateur)
			affichage_utilisateurs.afficher_utilisateur(p_utilisateur)
			
        end
        
    -- Ajouter des utilisateurs
    ajouter_utilisateurs(p_utilisateurs:ARRAY[UTILISATEUR]) is
        do
            liste_utilisateurs.ajouter_liste(p_utilisateurs)
        end

	-- Formulaire de saisi pour un utilisateur
	formulaire_utilisateur:UTILISATEUR is
		local
			existe : BOOLEAN
			identifiant : STRING
			nom : STRING
			prenom : STRING
			rep : STRING
			admin : BOOLEAN
			p_utilisateur : UTILISATEUR
			correct: BOOLEAN
		do
			existe := True
			
			create nom.make_empty
			create prenom.make_empty
			create identifiant.make_empty
			admin := False	
			correct := False		

			-- demander de saisir l'identifiant
		    from
			until (not existe) and correct
            loop
	      		identifiant.copy(affichage_utilisateurs.saisir_identifiant)

				-- L'identifiant doit être renseigné
				from
				until not identifiant.is_empty
				loop
					affichage_utilisateurs.champ_vide
					identifiant.copy(affichage_utilisateurs.saisir_identifiant)
				end

				-- savoir si l'identifiant existe
			    existe := liste_utilisateurs.existe_id(identifiant)
				if existe then
					-- identifiant déjà connu
				    affichage_utilisateurs.afficher_identifiant_existe
			    elseif identifiant.first_substring_index(" ") /= 0 then
					-- identifiant contient des espaces
			        affichage_utilisateurs.afficher_identifiant_incorrect
		        else
		            correct := True
				end
			 end

			-- saisir le nom
			nom.copy(affichage_utilisateurs.saisir_nom)
			-- le nom doit être non vide
			from
			until not nom.is_empty
			loop
				affichage_utilisateurs.champ_vide
				nom.copy(affichage_utilisateurs.saisir_nom)
			end
			

			-- saisir le prénom
			prenom.copy(affichage_utilisateurs.saisir_prenom)
			-- le prenom doit être non vide
			from
			until not prenom.is_empty
			loop
				affichage_utilisateurs.champ_vide
				prenom.copy(affichage_utilisateurs.saisir_prenom)
			end

			-- saisir le type de l'utilisateur
			create rep.make_from_string("")
			from
			until rep.is_equal("o") or rep.is_equal("n")
			loop
			    rep.copy(affichage_utilisateurs.saisir_admin)			
			end
            if rep.is_equal("O") then
                admin := True
            else
                admin := False
            end

			-- instancier l'utilisateur
			create p_utilisateur.nouveau(identifiant,nom,prenom,admin)
			Result := p_utilisateur
		end	

	-- Ajouter un utilisateur par le formulaire rempli 
	ajouter_form_utilisateur is
		local
			utilisateur : UTILISATEUR
		do
			-- nom de la fonctionnalité
		    affichage_utilisateurs.afficher_nouvel_utilisateur

		    -- nouvel utilisateur
			utilisateur := formulaire_utilisateur
			-- AJouter l'utilisateur
			liste_utilisateurs.ajouter(utilisateur)
			
			-- informations du nouvel utilisateur
			affichage_utilisateurs.afficher_nouvel_utilisateur_cree(utilisateur)
			affichage_utilisateurs.afficher_fin_nouvel_utilisateur
		end	

	-- Supprimer un utilisateur
	supprimer is
		local
			utilisateur:UTILISATEUR
			nombre_emprunts:INTEGER
			rep : STRING
			identifiant:STRING
			position : INTEGER
			utilisateurs:ARRAY[UTILISATEUR]
		do
			rep := ""
			affichage_utilisateurs.afficher_suppression_debut

			-- Rechercher l'utilisateur a supprimé
			utilisateur:= rechercher_utilisateur
			-- Rechercher si emprunt en cours
			nombre_emprunts := liste_emprunts.nombre_emprunts(utilisateur)
			-- Demande de suppression définitive
			if nombre_emprunts = 0 then
				-- affichage de la demande définitive
				from
				until not (rep.is_equal("O")) or not (rep.is_equal("N"))
				loop
					rep:= affichage_utilisateurs.afficher_demande_suppresion
				end

				if rep.is_equal("O") then
					identifiant := utilisateur.get_identifiant
					-- Recherche de la position dans le tableau des utilisateurs
					position := liste_utilisateurs.position_utilisateur(utilisateur)

					if position /= 0 then
						utilisateurs := liste_utilisateurs.lister_utilisateurs
						utilisateurs.remove(position)
						-- Affichage du message de suppression
						affichage_utilisateurs.afficher_suppression(identifiant)
					end
				else
					-- Affichage suppression annulée
					affichage_utilisateurs.afficher_suppression_annulee
				end
			else
				--affichage erreur : emprunt en cours
				affichage_utilisateurs.afficher_erreur_suppression
			end
		end

	-- Récupérer un utilisateur par son identifiant	
    get_utilisateur(p_identifiant:STRING): UTILISATEUR is
        do
            Result := liste_utilisateurs.get_utilisateur(p_identifiant)
        end

	-- Consulter un utilisateur
	consulter is
		local
			utilisateurs: ARRAY[UTILISATEUR]
			autre_recherche: BOOLEAN
			autre_consultation: BOOLEAN
			choix_menu: INTEGER
		do
			create utilisateurs.make(0,0)
            autre_recherche := True
            autre_consultation := True
            
            from
            until not autre_recherche
            loop
            
                autre_consultation := True

			    -- Choix du type d'utilisateur
			    utilisateurs := rechercher
			    
			    if utilisateurs /= Void and utilisateurs.count > 1 then
			        from 
			        until not autre_consultation
			        loop

			            -- Afficher résultat
			            affichage_utilisateurs.afficher_recherche_resultats(utilisateurs)
			
			            -- Choix de l'utilisateur a consulter
			            choix_menu := affichage_utilisateurs.saisir_utilisateur_selectionne(utilisateurs.count-1)
			            
			            if choix_menu = 0 then
			                autre_consultation := False
		                else
		                     affichage_utilisateurs.afficher_utilisateur(utilisateurs.item(choix_menu))
		                     
		                     affichage_utilisateurs.afficher_consultation_suivante
		                     choix_menu := affichage_utilisateurs.saisir_choix_menu(2)
		                     
		                     inspect choix_menu
                                when 1 then
                                    autre_consultation := False
                                when 2 then
                                when 0 then
                                    autre_consultation := False
                                    autre_recherche := False
                            end
                        end
			        
			        end
                else
                    
                    if utilisateurs /= Void then
                        affichage_utilisateurs.afficher_recherche_incorrecte
                    else
                        autre_recherche := False
                    end
                end 
            
            end

		end

	-- Informations du client connecté
	info_compte(p_utilisateur:UTILISATEUR; gestionnaire_emprunts : GESTIONNAIRE_EMPRUNTS) is
		do
			create emprunts.make(0,0)

			affichage_utilisateurs.info_debut
			-- Informations personnelles du client
			affichage_utilisateurs.afficher_utilisateur(p_utilisateur)

			-- Les emprunts de l'utilisateur
			affichage_utilisateurs.emprunt_debut

            gestionnaire_emprunts.emprunts_utilisateur(p_utilisateur)

		end

 	-- rechercher           
    rechercher: ARRAY[UTILISATEUR] is
        local
            choix_recherche: INTEGER
            resultat_recherche: ARRAY[UTILISATEUR]
        do
            create resultat_recherche.make(0,0)
        
            choix_recherche := -1
        
            affichage_utilisateurs.afficher_recherche_debut
            
            choix_recherche := affichage_utilisateurs.afficher_recherche_menu_type
            
            inspect choix_recherche
                when 1 then
                    resultat_recherche.copy(rechercher_admin)
                when 2 then
                    resultat_recherche.copy(rechercher_client)
                else
                    resultat_recherche := Void
            end
            affichage_utilisateurs.afficher_recherche_fin
           
			Result := resultat_recherche

        end
        
    rechercher_utilisateur: UTILISATEUR is
        local
			utilisateurs: ARRAY[UTILISATEUR]
			autre_recherche: BOOLEAN
			--autre_consultation: BOOLEAN
			choix_menu: INTEGER
        do
            create utilisateurs.make(0,0)
            autre_recherche := True
            
            from
            until not autre_recherche
            loop
            
			    -- Choix du type d'utilisateur
			    utilisateurs := rechercher
			    
			    if utilisateurs /= Void and then utilisateurs.count > 1 then

		            -- Afficher résultat
		            affichage_utilisateurs.afficher_recherche_resultats(utilisateurs)
		
		            -- Choix de l'utilisateur a consulter
		            choix_menu := affichage_utilisateurs.saisir_utilisateur_selectionne(utilisateurs.count-1)
		            
		            if choix_menu /= 0 then
                        Result := utilisateurs.item(choix_menu)
                        autre_recherche := False
                    end
			        
                else
                    
                    if utilisateurs /= Void then
                        affichage_utilisateurs.afficher_recherche_incorrecte
                    else
                        autre_recherche := False
                    end
                end 
            
            end
        end

feature {NONE}

    -- rechercher un administrateur    
    rechercher_admin: ARRAY[UTILISATEUR] is
        local
            identifiant: STRING
            nom: STRING
            prenom: STRING
			admin: BOOLEAN
        do
			affichage_utilisateurs.afficher_recherche_admin
            create identifiant.make_from_string(affichage_utilisateurs.saisir_identifiant)
            create nom.make_from_string(affichage_utilisateurs.saisir_nom)
            create prenom.make_from_string(affichage_utilisateurs.saisir_prenom)
			admin := True
            Result := liste_utilisateurs.rechercher_admin(identifiant, nom, prenom, admin)
        end

    -- rechercher un client
    rechercher_client: ARRAY[UTILISATEUR] is
	local
    	identifiant: STRING
        nom: STRING
        prenom: STRING
		admin: BOOLEAN
        do
			affichage_utilisateurs.afficher_recherche_client
        	create identifiant.make_from_string(affichage_utilisateurs.saisir_identifiant)
            create nom.make_from_string(affichage_utilisateurs.saisir_nom)
           	create prenom.make_from_string(affichage_utilisateurs.saisir_prenom)
			admin := False
            Result := liste_utilisateurs.rechercher_client(identifiant, nom, prenom, admin)
        end
			
end
