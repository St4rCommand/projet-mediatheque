class AFFICHAGE_MEDIAS

inherit 
	AFFICHAGE
	
feature {NONE}

    tableau_to_string(tab: ARRAY[STRING]): STRING is
        local
            i: INTEGER
            string: STRING
        do
            create string.make_empty
            
            from i := 1
            until i = tab.count
            loop
                string.append(tab.item(i))
                
                if i /= tab.count-1 then
                    string.append(", ")
                end
                
                i := i+1
            end
            
            Result := string
        end
        
feature {ANY}

    ---
    --- Fonction de saisie
    saisir_titre: STRING is
        local
            titre: STRING
        do
            create titre.make_empty
            io.put_string(" Saisir le titre : ")
            titre.copy(saisir_string)
            
            Result := titre
        end

    ---
    --- Saisir le nombre d'exemplaires        
    saisir_nombre: INTEGER is
        local
            nombre: STRING
        do
            create nombre.make_empty
            
            io.put_string(" Saisir le nombre d'exemplaires : ")
            nombre.copy(saisir_string)
        
            from
            until nombre.is_integer or nombre.is_empty
            loop
                nombre.make_empty
                io.put_string(" Saisir le nombre d'exemplaires : ")
                nombre.copy(saisir_string)
            end
            
            if nombre.is_integer then           
                Result := nombre.to_integer
            else
                Result := -1
            end
        end

    ---
    --- Saisir l'auteur        
    saisir_auteur: STRING is
        local
            auteur: STRING
        do
            create auteur.make_empty
            io.put_string(" Saisir l'auteur : ")
            auteur.copy(saisir_string)
            
            Result := auteur
        end

    ---
    --- Saisir l'année       
    saisir_annee: INTEGER is
        local
            annee: STRING
        do
            create annee.make_empty
            
            io.put_string(" Saisir l'année : ")
            annee.copy(saisir_string)

            --- possibilité de saisir un champs vide
            from
            until annee.is_integer or annee.is_empty
            loop
                io.put_string(" Saisir l'année : ")
                annee.copy(saisir_string)
            end
            --- Vérification si l'année est un entier
            if annee.is_integer then           
                Result := annee.to_integer
            else
                Result := -1
            end
        end
      
    ---
    --- Saisir le réalisateur  
    saisir_realisateur: STRING is
        local
            realisateur: STRING
        do
            create realisateur.make_empty
            io.put_string(" Saisir le prénom et le nom du realisateur : ")
            realisateur.copy(saisir_string)
            
            Result := realisateur
        end

    ---
    --- Saisir l'acteur       
    saisir_acteur: STRING is
        local
            acteur: STRING
        do
            create acteur.make_empty
            io.put_string(" Saisir le prénom et le nom de l'acteur : ")
            acteur.copy(saisir_string)
            
            Result := acteur
        end

    ---
    --- Saisir le type du DVD       
    saisir_type_dvd: STRING is
        local
            type: STRING
        do
            create type.make_empty
            io.put_string(" Saisir le type de DVD : ")
            type.copy(saisir_string)
            
            Result := type
        end        
        
    --
    -- Fonction d'affichage
    --
        
	--- Afficher une liste de médias en les affichant 1 par 1
    afficher_medias(p_medias: ARRAY[MEDIA]) is
        local
            i: INTEGER
        do
            io.put_string(" *** Affichage des médias *** %N%N")
            
    		from
			    i := 1
		    until
				-- Si on arrive à la fin de la liste, arrêter l'affichage
			    i = p_medias.count
		    loop
				-- Affichage du média à la position i dans la liste
		        afficher_media(p_medias.item(i))
		        i := i+1
		    end
		    
            io.put_string(" ****** %N%N")
        end
        
	-- Afficher un média
    afficher_media(p_media: MEDIA) is
        local
            livre: LIVRE
            dvd: DVD
        do
        	-- Déterminer le type de média
            if {LIVRE} ?:= p_media then
                create livre.nouveau
                livre ::= p_media
                afficher_livre(livre)
            elseif {DVD} ?:= p_media then
                create dvd.nouveau
                dvd ::= p_media
                afficher_dvd(dvd)
            end
        end

    -- Afficher un livre avec ses caractéristiques    
    afficher_livre(p_livre: LIVRE) is
        do
            io.put_string("| "+p_livre.get_titre+"%N")
            io.put_string("| de "+p_livre.get_auteur+"%N")
            io.put_string("| ("+p_livre.get_nombre.to_string+" exemplaires)%N")
            io.put_string("%N")
        end

    -- Afficher un DVD avec ses caractéristiques    
    afficher_dvd(p_dvd: DVD) is
        do
            io.put_string("| "+p_dvd.get_titre+" ("+p_dvd.get_annee.to_string+")%N")
            io.put_string("| "+p_dvd.get_type+"%N")
            io.put_string("| ("+p_dvd.get_nombre.to_string+" exemplaires)%N")
            io.put_string("| Réalisateur(s) : "+tableau_to_string(p_dvd.get_realisateurs)+"%N")
            io.put_string("| Acteurs : "+tableau_to_string(p_dvd.get_acteurs)+"%N")
            io.put_string("%N")
        end

    ---
    --- Titre de la fonctionnalité rechercher        
    afficher_recherche_debut is
        do
            io.put_string(" *** Rechercher des médias *** %N%N")
        end

    ---
    --- Titre de la fonctionnalité rechercher DVD    
    afficher_menu_recherche_dvd is
        do
            io.put_string(" *** Rechercher des DVD *** %N%N")
        end
    
    ---
    --- Titre de la fonctionnalité rechercher livre
    afficher_menu_recherche_livre is
        do
            io.put_string(" *** Rechercher des livres *** %N%N")
        end
        
    ---
    --- Menu de la focntionnalité rechercher 
    afficher_recherche_menu_type is
        do
            io.put_string(" Type de média à rechercher : %N%N")
            io.put_string(" 1 - DVD %N")
            io.put_string(" 2 - Livre%N")
            io.put_string(" 3 - Tout (sur le titre uniquement)%N")
            io.put_string("%N 0 - Quitter%N")
        end
     
    ---
    --- Afficher une liste de médias  
    afficher_recherche_resultats(medias: ARRAY[MEDIA]) is
        local
            i: INTEGER
            media_courant: MEDIA
        do
            io.put_string("Résultats de la recherche : %N%N")
            
            from i := 1
            until i = medias.count
            loop
                media_courant := medias.item(i)
                io.put_string(i.to_string+"| ")
                
                if {LIVRE} ?:= media_courant then
                    io.put_string("Livre : ")
                elseif {DVD} ?:= media_courant then
                    io.put_string("DVD : ")
                end
                
                io.put_string(media_courant.get_titre+"%N")
                
                i := i+1
            end
            
            io.put_string("%N --- %N")
        end
        
    ---
    --- Fin de la fonctionnalité recherche
    afficher_recherche_fin is
        do
            io.put_string("%N ****** %N%N")
        end
        
    ---
    --- Menu de la fonctionnalité ajouter
    afficher_creer_menu_type is
        do
            io.put_string(" Type de média à créer : %N%N")
            io.put_string(" 1 - DVD %N")
            io.put_string(" 2 - Livre%N")
            io.put_string("%N 0 - Quitter%N")
        end
        
    ---
    --- Faire un nouveau choix sur la fonction ajout
    afficher_ajout_suivant is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Nouvel ajout %N")
            io.put_string("%N 0 - Quitter%N")
        end
        
    ---
    --- Menu pour ajouter un realisateur 
    afficher_saisir_autre_realisateur is
        do
            io.put_string(" Ajouter un autre réalisateur :%N%N")
            io.put_string(" 1 - Oui %N")
            io.put_string(" 0 - Non%N")
        end
    
    ---
    --- Menu pour ajouter un acteur 
    afficher_saisir_autre_acteur is
        do
            io.put_string(" Ajouter un autre acteur : %N%N")
            io.put_string(" 1 - Oui %N")
            io.put_string(" 0 - Non%N")
        end
        
    ---
    --- Menu pour modifier un realisateur 
    afficher_modifier_dvd_menu_realisateur(p_realisateur: STRING) is
        do
            io.put_string(" Réalisateur "+p_realisateur+" : %N%N")
            io.put_string(" 0 - Continuer%N")
            io.put_string(" 1 - Modifier %N")
            io.put_string(" 2 - Supprimer%N")
        end
      
    ---
    --- Menu pour modifier un acteur  
    afficher_modifier_dvd_menu_acteur(p_acteur: STRING) is
        do
            io.put_string(" Acteur "+p_acteur+" : %N%N")
            io.put_string(" 0 - Continuer%N")
            io.put_string(" 1 - Modifier %N")
            io.put_string(" 2 - Supprimer%N")
        end
        
    ---
    --- Message d'erreur pour la modification du nombre d'exemplaire
    afficher_nombre_emprunts_superieur is
        do
            afficher_message_erreur("Le nombre d'exemplaire du média ne peut %N *** pas être inférieur au nombre emprunté")
        end

end
