class AFFICHAGE_MEDIAS

feature {NONE}

    afficher_tableau_string(tab: ARRAY[STRING]): STRING is
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
        	-- En fonction du type du média on crée un livre
            if {LIVRE} ?:= p_media then
                create livre.nouveau
                livre ::= p_media
                afficher_livre(livre)
            else
				-- sinon on crée un DVD
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

    -- Afficher un dvd avec ses caractéristiques    
    afficher_dvd(p_dvd: DVD) is
        do
            io.put_string("| "+p_dvd.get_titre+" ("+p_dvd.get_annee.to_string+")%N")
            io.put_string("| "+p_dvd.get_type+"%N")
            io.put_string("| ("+p_dvd.get_nombre.to_string+" exemplaires)%N")
            io.put_string("| Réalisateur(s) : "+afficher_tableau_string(p_dvd.get_realisateurs)+"%N")
            io.put_string("| Acteurs : "+afficher_tableau_string(p_dvd.get_acteurs)+"%N")
            io.put_string("%N")
        end
        

end
