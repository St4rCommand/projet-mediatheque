deferred class AFFICHAGE

---
--- Classe abstraitre regroupant les fonctions d'affichages
---

feature {ANY}

    ---
    --- Menu pour choisir l'action suivante (consultation ou recherche)
    afficher_consultation_suivante is
    do
        io.put_string(" *** %N")
        io.put_string(" 1 - Nouvelle recherche %N")
        io.put_string(" 2 - Sélectionnez en un autre %N")
        io.put_string("%N 0 - Quitter%N")
    end
    
    ---
    --- Saisir une chaine de caractère
    saisir_string: STRING is
    local
    do
        io.flush
        io.read_line
        Result := io.last_string
    end
    
    ---
    --- Saisir le choix d'un menu
    saisir_choix_menu(choix_max: INTEGER): INTEGER is
    local
        choix: STRING
    do
        
        io.put_string("%N --- %N")
        create choix.make_empty
    
        from
        until choix_correct(choix, choix_max)
        loop
            io.put_string(" Choix : ")
            choix.copy(saisir_string)
        end
        
        io.put_string(" --- %N%N")
        
        Result := choix.to_integer
    end
    
    ---
    --- Vérifier si le choix du menu est correct
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
    
    ---
    --- Affichage où la recherche ne retourne aucun résultat
    afficher_recherche_incorrecte is
    do
        io.put_string("Résultats de la recherche : %N%N")
        io.put_string(" | Aucun résultat pour votre recherche !%N")
        io.put_string("%N --- %N%N")
    end

    ---
    --- Afficher un message d'erreur
    afficher_message_erreur(p_string: STRING) is
        do
            io.put_string(" ***%N")
            io.put_string(" *** "+p_string+"%N")
            io.put_string(" ***%N%N")
        end
end
