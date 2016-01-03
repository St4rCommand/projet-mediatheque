class LISTE_EMPRUNTS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des EMPRUNTS
    liste_emprunts: ARRAY[EMPRUNTS]
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_emprunts.make(0,0)
        end

	-- Lister les emprunts		
	lister_emprunts:ARRAY[EMPRUNT] is
    do
        Result := liste_emprunts
    end

    -- Ajouter un emprunt
    ajouter(p_emprunt: EMPRUNT) is
        do
            liste_emprunts.add_last(p_emprunt)

        end

	rechercher_emprunt(p_utilisateur: UTILISATEUR):ARRAY[EMPRUNT] is
		local
			emprunt_courant: EMPRUNT
			emprunt_trouves: ARRAY[EMPRUNT]
			i:INTEGER
		do
			create emprunt_trouves.make(0,0)
            
            from i:=1
            until i = liste_emprunts.count
            loop
                emprunt_courant := liste_emprunts.item(i)
                
                if emprunt_courant /= Void
                and then mprunt_courant.get_utilisateur.has_substring(p_utilisateur)
                then
                    emprunt_trouves.add_last(emprunt_courant)
                end
                
                i := i+1
            end
            
            Result := emprunt_trouves
		end
        
end
