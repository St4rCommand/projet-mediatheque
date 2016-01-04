class AFFICHAGE_EMPRUNTS

inherit 
	AFFICHAGE
	
feature {ANY}

    afficher_nouvel_emprunt is
        do
            io.put_string(" *** Ajouter un nouvel emprunt *** %N%N")
        end
    
    afficher_continuer is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Ajouter un autre média %N")
            io.put_string("%N 0 - Fin de l'emprunt%N")
            io.put_string("%N --- %N")
        end
    
    afficher_emprunts(p_emprunts: ARRAY[EMPRUNT]) is
        local
            i:INTEGER
        do
            from i := 1
            until i = p_emprunts.count
            loop
                afficher_emprunt(p_emprunts.item(i))
                i := i+1 
            end
        end
        
    afficher_emprunt(p_emprunt: EMPRUNT) is
        do
            io.put_string("| "+p_emprunt.get_utilisateur.get_identifiant+" emprunte"+p_emprunt.get_media.get_titre+"%N")
        end

end
