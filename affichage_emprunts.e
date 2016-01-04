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
            io.put_string("| "+p_emprunt.get_utilisateur.get_identifiant+" emprunte "+p_emprunt.get_media.get_titre+"%N")
        end

	-- les emprunts pour un utilisateur
    afficher_details_emprunts(p_emprunts: ARRAY[EMPRUNT]) is
        local
            i:INTEGER
        do
            from i := 1
            until i = p_emprunts.count
            loop
                afficher_detail_emprunt(p_emprunts.item(i))
                i := i+1 
            end
        end

    -- Un seul utilisateur : afficher tous ses emprunts   
    afficher_detail_emprunt(p_emprunt: EMPRUNT) is
		local
			jour : INTEGER
			mois : INTEGER
			annee: INTEGER
        do
			jour := p_emprunt.get_date_debut.day
			mois := p_emprunt.get_date_debut.month
		  	annee := p_emprunt.get_date_debut.year
            io.put_string("| "+p_emprunt.get_media.get_titre+" emprunté le "+jour.to_string+"-"+mois.to_string+"-"+annee.to_string+"%N")
        end

end
