class AFFICHAGE_EMPRUNTS

inherit 
	AFFICHAGE
	
creation
    nouveau
    
feature {NONE}

    --- durée maximale en semaine d'un emprunt
    delai_emprunt_media: INTEGER
	
feature {ANY}

    nouveau (p_delai_emprunt_media: INTEGER) is
        do
            delai_emprunt_media := p_delai_emprunt_media
        end
    
    ---
    --- Titre fonction nouvel emprunt
    afficher_nouvel_emprunt is
        do
            io.put_string(" *** Ajouter un nouvel emprunt *** %N%N")
        end
        
    ---
    --- Titre fonction rendre média
    afficher_nouveau_rendu is
        do
            io.put_string(" *** Effectuer un rendu *** %N%N")
        end
        
    ---
    --- Titre fonctions emprunts en retard
    afficher_retard_debut is
		do
            io.put_string(" *** Emprunts non rendu à la date du retour fixée *** %N%N")
		end
		
	---
	--- Menu ajouter un autre média
    afficher_ajouter_autre_media is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Ajouter un autre média %N")
            io.put_string(" 0 - Fin de l'emprunt%N")
        end
    
    ---
    --- Menu saisir un autre emprunt
    afficher_ajouter_autre_emprunt is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Saisir un autre emprunt%N")
            io.put_string(" 0 - Quitter%N")
        end
    
    ---
    --- Afficher une liste d'emprunts avec l'emprunteur et la date de rendu
    afficher_emprunts(p_emprunts: ARRAY[EMPRUNT]) is
        require
            p_emprunts.count > 1
        do
            io.put_string("  | "+p_emprunts.item(1).get_utilisateur.get_identifiant+" ("+p_emprunts.item(1).get_utilisateur.get_prenom+" "+p_emprunts.item(1).get_utilisateur.get_nom+") emprunte :%N")
            afficher_emprunts_liste(p_emprunts)
            io.put_string("  | à rendre le "+p_emprunts.item(1).get_date_rendu(delai_emprunt_media).to_string+"%N")
            io.put_string("%N ****** %N%N")
        end
    
    --- 
    --- Afficher une liste d'emprunts
    afficher_emprunts_liste(p_emprunts: ARRAY[EMPRUNT]) is
        local
            i: INTEGER
            emprunt_courant: EMPRUNT
        do
            from i := 1
            until i = p_emprunts.count
            loop
                emprunt_courant := p_emprunts.item(i)
                io.put_string(i.to_string+" | ")
                afficher_emprunt(emprunt_courant)
                i := i+1 
            end
        end
    
    ---
    --- Afficher le nom du média emprunté
    afficher_emprunt(p_emprunt: EMPRUNT) is
        do
            io.put_string(p_emprunt.get_media.get_titre+"%N")
        end

    ---
	--- Afficher la liste des emprunts d'un utilisateur
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

    ---
    --- Afficher tous les emprunts d'un utilisateur
    afficher_detail_emprunt(p_emprunt: EMPRUNT) is
        do
            io.put_string("| "+p_emprunt.get_media.get_titre+" à rendre le "+p_emprunt.get_date_rendu(delai_emprunt_media).to_string+"%N")
        end
        
    --- 
    --- Affichage limite du nombre d'emprunts pour un utilisateur
    afficher_limite_emprunts_atteinte is
        do
            afficher_message_erreur("Vous avez atteint le nombre maximum d'emprunts pour cet utilisateur !")
        end
        
    ---
    --- Menu pour savoir l'action suivante à faire
    afficher_autre_rendu is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Rendre des médias pour un autre utilisateur %N")
            io.put_string(" 0 - Quitter%N")
        end
    
    ---
    --- Menu pour savoir l'action suivante à faire    
    afficher_supprimer_autre_emprunt is
        do
            io.put_string(" *** %N")
            io.put_string(" 1 - Rendre un autre média pour cet utilisateur %N")
            io.put_string(" 0 - Quitter%N")
        end

    ---
    --- Message pour indiquer que l'utilisateur n'a pas d'emprunt à rendre   
    afficher_aucun_emprunt is
        do
            afficher_message_erreur("Aucun emprunt à supprimer pour cet utilisateur")
        end
    
    ---
    --- Message d'erreur pour l'indisponibilité d'un média    
    afficher_media_indisponible is
        do
            afficher_message_erreur("Le média que vous avez sélectionné %N *** ne peut pas être emprunté %N *** car il n'est plus disponible")
        end
    ---
    --- Message quand il n'y a aucun emprunts en retard    
    afficher_aucun_retard is
        do
            io.put_string(" | Aucun emprunt n'est en retard%N%N")
        end
    

    ---
    --- Affichage du message dans les infos du compte pour les emprunts en cours    
    afficher_aucun_emprunt_utilisateur is
    do
        io.put_string(" | Aucun emprunt%N%N")
    end

end
