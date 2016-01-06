class AFFICHAGE_EMPRUNTS

inherit 
	AFFICHAGE
	
creation
    nouveau
    
feature {NONE}
    delai_emprunt_media: INTEGER
	
feature {ANY}

    nouveau (p_delai_emprunt_media: INTEGER) is
        do
            delai_emprunt_media := p_delai_emprunt_media
        end

    afficher_nouvel_emprunt is
        do
            io.put_string(" *** Ajouter un nouvel emprunt *** %N%N")
        end
        
    afficher_nouveau_rendu is
        do
            io.put_string(" *** Effectuer un rendu *** %N%N")
        end
    afficher_retard_debut is
		do
            io.put_string(" *** Emprunts non rendu à la date du retour fixée *** %N%N")
		end
    afficher_ajouter_autre_media is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Ajouter un autre média %N")
            io.put_string(" 0 - Fin de l'emprunt%N")
        end
    
    afficher_ajouter_autre_emprunt is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Saisir un autre emprunt%N")
            io.put_string(" 0 - Quitter%N")
        end
    
    afficher_emprunts(p_emprunts: ARRAY[EMPRUNT]) is
        local
            i:INTEGER
            emprunt_courant: EMPRUNT
        do
            from i := 1
            until i = p_emprunts.count
            loop
                emprunt_courant := p_emprunts.item(i)
                io.put_string(i.to_string+"| ")
                afficher_emprunt(emprunt_courant)
                i := i+1 
            end
            io.put_string("%N ****** %N%N")
        end
        
    afficher_emprunt(p_emprunt: EMPRUNT) is
        do
            io.put_string(p_emprunt.get_utilisateur.get_identifiant+" emprunte "+p_emprunt.get_media.get_titre+"%N")
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
            io.put_string("| "+p_emprunt.get_media.get_titre+" à rendre le "+p_emprunt.get_date_rendu(delai_emprunt_media).to_string+"%N")
        end
        
    afficher_limite_emprunts_atteinte is
        do
            afficher_message_erreur("Vous avez atteint le nombre maximum d'emprunts pour cet utilisateur !")
        end
        
    afficher_autre_rendu is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Rendre des médias pour un autre utilisateur %N")
            io.put_string(" 0 - Quitter%N")
        end
        
    afficher_supprimer_autre_emprunt is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Rendre un autre média pour cet utilisateur %N")
            io.put_string(" 0 - Quitter%N")
        end
        
    afficher_aucun_emprunt is
        do
            afficher_message_erreur("Aucun emprunt à supprimer pour cet utilisateur")
        end
        
    saisir_emprunt_selectionne(choix_max: INTEGER): INTEGER is
        local
            choix: STRING
        do
            
            io.put_string("%N --- %N")
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
        
    afficher_media_indisponible is
        do
            afficher_message_erreur("Le média que vous avez sélectionné %N *** ne peut pas être emprunté %N *** car il n'est plus disponible")
        end

end
