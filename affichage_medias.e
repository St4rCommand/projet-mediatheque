class AFFICHAGE_MEDIAS

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

    --
    -- Fonction de saisie
    --
    
    saisir_string: STRING is
        local
        do
            io.flush
            io.read_line
            Result := io.last_string
        end
        
    saisir_titre: STRING is
        local
            titre: STRING
        do
            titre.make_from_string("")
            io.put_string(" Saisir le titre : ")
            titre.copy(saisir_string)
            
            Result := titre
        end
        
    saisir_nombre: INTEGER is
        local
            nombre: STRING
        do
            from
            until nombre.is_integer
            loop
                nombre.make_from_string("")
                io.put_string(" Saisir le nombre d'exemplaires : ")
                nombre.copy(saisir_string)
            end
            
            Result := nombre.to_integer
        end
        
    saisir_auteur: STRING is
        local
            auteur: STRING
        do
            auteur.make_from_string("")
            io.put_string(" Saisir l'auteur : ")
            auteur.copy(saisir_string)
            
            Result := auteur
        end
        
    saisir_annee: INTEGER is
        local
            annee: STRING
        do
            from
            until annee.is_integer
            loop
                annee.make_from_string("")
                io.put_string(" Saisir l'année : ")
                annee.copy(saisir_string)
            end
            
            Result := annee.to_integer
        end
        
    saisir_realisateur: STRING is
        local
            realisateur: STRING
        do
            realisateur.make_from_string("")
            io.put_string(" Saisir le prénom et le nom du realisateur : ")
            realisateur.copy(saisir_string)
            
            Result := realisateur
        end
        
    saisir_acteur: STRING is
        local
            acteur: STRING
        do
            acteur.make_from_string("")
            io.put_string(" Saisir le prénom et le nom de l'acteur : ")
            acteur.copy(saisir_string)
            
            Result := acteur
        end
        
    saisir_type_dvd: STRING is
        local
            type: STRING
        do
            type.make_from_string("")
            io.put_string(" Saisir le type de DVD : ")
            type.copy(saisir_string)
            
            Result := type
        end
        
    saisir_choix_menu(choix_max: INTEGER): INTEGER is
        local
            choix: STRING
        do
            create choix.make_empty
        
            from
            until choix_correct(choix, choix_max)
            loop
                io.put_string(" Choix : ")
                choix.copy(saisir_string)
            end
            
            Result := choix.to_integer
        end
        
    saisir_media_selectionne(choix_max: INTEGER): INTEGER is
        local
            choix: STRING
        do
            create choix.make_empty
        
            from
            until choix_correct(choix, choix_max)
            loop
                io.put_string(" Choix (0 - Nouvelle recherche) : ")
                choix.copy(saisir_string)
            end
            
            Result := choix.to_integer
            
            io.put_string(" --- %N%N")
        end
        
    choix_correct(choix: STRING; choix_max: INTEGER):BOOLEAN is
        do
            if choix.is_integer then
                if choix.to_integer >= 0  and choix.to_integer <= choix_max then
                    Result := True
                else
                    Result := False
                end
            else
                Result := False
            end
        
        end
        
        
    --
    -- Fonction d'affichage
    --
        
	-- Afficher une liste de médias en les affichant 1 par 1
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
        
    afficher_recherche_debut is
        do
            io.put_string(" *** Rechercher des médias *** %N%N")
        end
    
    afficher_menu_recherche_dvd is
        do
            io.put_string(" *** Rechercher des DVD *** %N%N")
        end
    
    afficher_menu_recherche_livre is
        do
            io.put_string(" *** Rechercher des livres *** %N%N")
        end
        
    afficher_recherche_menu_type is
        do
            io.put_string(" *** Type de média à rechercher *** %N%N")
            io.put_string(" 1 - DVD %N")
            io.put_string(" 2 - Livre%N")
            io.put_string(" 3 - Tout%N")
            io.put_string("%N 0 - Quitter%N")
            io.put_string("%N --- %N")
        end
        
    afficher_recherche_resultats(medias: ARRAY[MEDIA]) is
        local
            i: INTEGER
            media_courant: MEDIA
        do
            if medias.count = 0 then
                io.put_string(" | Aucun média ne correspond à votre recherche !%N")
            else
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
            end
            
            io.put_string("%N --- %N")
        end
        
    afficher_consultation_suivante is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Nouvelle recherche %N")
            io.put_string(" 2 - Sélectionner un autre média%N")
            io.put_string("%N 0 - Quitter%N")
            io.put_string("%N --- %N")
        end
        
    afficher_recherche_fin is
        do
            io.put_string(" ****** %N%N")
        end

end
