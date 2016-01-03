class LISTE_EMPRUNTS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des emprunts
    liste_emprunts: ARRAY[EMPRUNT]
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_emprunts.make(0,0)
        end

	-- Lister tous les emprunts	de la médiathèque
	lister_emprunts:ARRAY[EMPRUNT] is
    do
        Result := liste_emprunts
    end

	-- Lister tous les emprunts pour un utilisateur
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
                and then emprunt_courant.get_utilisateur.has_substring(p_utilisateur)
                then
                    emprunt_trouves.add_last(emprunt_courant)
                end
                
                i := i+1
            end
            
            Result := emprunt_trouves
		end

    -- Ajouter un emprunt
    ajouter(p_emprunt: EMPRUNT) is
        do
            liste_emprunts.add_last(p_emprunt)
        end
	-- Le type du media emprunté
	type_media (p_media:MEDIA):STRING is
		local
			type : STRING
		do
			if {LIVRE} ?:= p_media
				Type := "livre"
			elseif {DVD} ?:= p_media
				Type := "dvd"
			end	
		end

    -- Le nombre d'exemplaire emprunté pour un media
	nb_exemplaire_emprunte(p_media:MEDIA):INTEGER is
		local
			-- nombre d'exemplaire emprunté pour un média
			exemplaire_emprunte: INTEGER
			-- le Type du media selectionné
			type_recherche: STRING
			-- le type du media consulté de la liste
			type_courant:STRING
			-- emprunt consulté
			emprunt_courant:EMPRUNT
			-- Parcours de la liste des emprunts
			i:INTEGER
		do
			-- Récupérer le type du média
			type_recherche:= type_media(p_media)
			exemplaire_emprunte := 0

			from i:= 1
			until i =liste_emprunts.count
			loop

				emprunt_courant := liste_emprunts.item(i)

				-- Recherche du type du media de l'emprunt consulté
                type_courant := type_media(emprunt_courant.get_media)

                if emprunt_courant /= Void
				and then type_recherche.is_equal(type_courant)
                and then emprunt_courant.get_media.has_substring(p_media)
                then
					-- Le média a été emprunté
                    exemplaire_emprunte := exemplaire_emprunte + 1
                end
                
                i := i+1
			end
		Result := exemplaire_emprunte
			
		end

end
