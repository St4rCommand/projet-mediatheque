class AFFICHAGE

feature {ANY}

    afficher_consultation_suivante is
    do
        io.put_string(" *** %N")
        io.put_string(" 1 - Nouvelle recherche %N")
        io.put_string(" 2 - Sélectionner un autre média%N")
        io.put_string("%N 0 - Quitter%N")
        io.put_string("%N --- %N")
    end
    
    saisir_string: STRING is
    local
    do
        io.flush
        io.read_line
        Result := io.last_string
    end
    
    saisir_choix_menu(choix_max: INTEGER): INTEGER is
    local
        choix: STRING
    do
        create choix.make_empty
    
        from
        until choix_correct(choix, choix_max)
        loop
            io.put_string(" Choix : ")
            choix.copy(saisir_string)
        end
        
        io.put_string("%N ****** %N%N")
        
        Result := choix.to_integer
    end
    
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
    
    afficher_recherche_incorrecte is
    do
        io.put_string("Résultats de la recherche : %N%N")
        io.put_string(" | Aucun résultat pour votre recherche !%N")
        io.put_string("%N --- %N%N")
    end
end
