class AFFICHAGE_UTILISATEURS

feature {NONE}
    
feature {ANY}
        
    afficher_utilisateurs(p_utilisateurs: ARRAY[UTILISATEUR]) is
        local
            i: INTEGER
        do
        	io.put_string(" *** Liste des utilisateurs *** %N%N")    
    		from
			    i := 1
		    until
			    i = p_utilisateurs.count
		    loop
		        afficher_utilisateur(p_utilisateurs.item(i))
				i := i+1
		    end
			io.put_string(" ****** %N%N")
        end
        
    afficher_utilisateur(p_utilisateur: UTILISATEUR) is
        do
            io.put_string("| Identifiant : "+p_utilisateur.get_identifiant+"%N")
            io.put_string("| Nom : "+p_utilisateur.get_nom+"%N")
            io.put_string("| Prénom :"+p_utilisateur.get_prenom+"%N")
            io.put_string("%N")
        end

end
