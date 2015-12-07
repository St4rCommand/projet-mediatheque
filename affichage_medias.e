class AFFICHAGE_MEDIAS

feature {NONE}
    
feature {ANY}
        
    afficher_medias(p_medias: ARRAY[MEDIA]) is
        local
            i: INTEGER
        do
            io.put_string(" *** Affichage des médias *** %N%N")
            
    		from
			    i := 1
		    until
			    i = p_medias.count
		    loop
		        afficher_media(p_medias.item(i))
		        i := i+1
		    end
		    
            io.put_string("%N%N ****** %N%N")
        end
        
    afficher_media(p_media: MEDIA) is
        local
            livre: LIVRE
            dvd: DVD
        do
        
            if {LIVRE} ?:= p_media then
                create livre.nouveau
                livre ::= p_media
                afficher_livre(livre)
            else
                create dvd.nouveau
                dvd ::= p_media
                afficher_dvd(dvd)
            end
        end
        
    afficher_livre(p_livre: LIVRE) is
        do
            io.put_string("| "+p_livre.get_titre+"%N")
            io.put_string("| de "+p_livre.get_auteur+"%N")
            io.put_string("| ("+p_livre.get_nombre.to_string+" exemplaires)%N")
            io.put_string("%N")
        end
        
    afficher_dvd(p_dvd: DVD) is
        do
            io.put_string("| "+p_dvd.get_titre+"("+p_dvd.get_annee.to_string+")%N")
            io.put_string("| "+p_dvd.get_type+"%N")
            io.put_string("| ("+p_dvd.get_nombre.to_string+" exemplaires)%N")
            io.put_string("%N")
        end
end
