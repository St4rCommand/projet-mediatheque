class AFFICHAGE_EMPRUNTS

inherit 
	AFFICHAGE
	
feature {ANY}

    afficher_nouvel_emprunt is
        do
            io.put_string(" *** Ajouter un nouvel emprunt *** %N%N")
        end
    
    afficher_ajouter_autre_media is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Ajouter un autre média %N")
            io.put_string(" 0 - Fin de l'emprunt%N")
            io.put_string("%N --- %N%N")
        end
    
    afficher_ajouter_autre_emprunt is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Saisir un autre emprunt%N")
            io.put_string(" 0 - Quitter%N")
            io.put_string("%N --- %N%N")
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
            io.put_string("%N ****** %N%N")
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
            
            
            io.put_string("%N")
        end

    -- Un seul utilisateur : afficher tous ses emprunts   
    afficher_detail_emprunt(p_emprunt: EMPRUNT) is
        do
            io.put_string("| "+p_emprunt.get_media.get_titre+" emprunté le "+p_emprunt.get_date_debut.to_string+"%N")
        end
        
    afficher_limite_emprunts_atteinte is
        do
            afficher_message_erreur("Vous avez atteint le nombre maximum d'emprunts pour cet utilisateur !")
        end

end
