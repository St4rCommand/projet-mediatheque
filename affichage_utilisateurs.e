class AFFICHAGE_UTILISATEURS

feature {NONE}
    
feature {ANY}
        
    afficher_utilisateurs(p_utilisateurs: ARRAY[UTILISATEUR]) is
        local
            i: INTEGER
        do
            
    		from
			    i := 0
		    until
			    i = p_utilisateurs.capacity
		    loop
		        afficher_utilisateur(p_utilisateurs.item(i))
		    end
        end
        
    afficher_utilisateur(p_utilisateur: UTILISATEUR) is
        local
            
        do
	    create utilisateur.nouveau
            utilisateur ::= p_utilisateur
            io.put_string(p_utilisateur.get_identifiant)
            io.put_string("nom : "+p_utilisateur.get_nom)
            io.put_string("prénom :"+p_utilisateur.get_prenom)
            
        end

end
