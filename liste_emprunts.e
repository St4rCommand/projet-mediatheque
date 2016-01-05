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

	-- Rechercher tous les emprunts pour un utilisateur
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
                
                --if emprunt_courant /= Void
               -- and then emprunt_courant.get_utilisateur.has_substring(p_utilisateur)
                --and then emprunt_courant.get_utilisateur = p_utilisateur
                if emprunt_courant.get_utilisateur = p_utilisateur
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
        
    -- Ajouter une liste d'emprunts
    ajouter_liste(p_emprunts: ARRAY[EMPRUNT]) is
        local
            i:INTEGER
        do
            from i := 1
            until i = p_emprunts.count
            loop
                ajouter(p_emprunts.item(i))
                i := i+1 
            end
            
        end

	-- Le type du media emprunté
	type_media (p_media:MEDIA):STRING is
		local
			type : STRING
		do
			if {LIVRE} ?:= p_media then
				type := "livre"
			elseif {DVD} ?:= p_media then
				type := "dvd"
			end

		    Result:= type	
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

--                if emprunt_courant /= Void
--				and then type_recherche.is_equal(type_courant)
--                and then emprunt_courant.get_media.has_substring(p_media)
                if emprunt_courant.get_media = p_media
                then
					-- Le média a été emprunté
                    exemplaire_emprunte := exemplaire_emprunte + 1
                end
                
                i := i+1
			end
		Result := exemplaire_emprunte
			
		end

	-- Le nombre d'emprunts pour un utilisateur
	nombre_emprunts(p_utilisateur: UTILISATEUR):INTEGER is
		local
			emprunt_courant: EMPRUNT
			nombre_emprunt:INTEGER
			i:INTEGER
		do
			nombre_emprunt := 0
            
            from i:=1
            until i = liste_emprunts.count
            loop
                emprunt_courant := liste_emprunts.item(i)
                if emprunt_courant.get_utilisateur = p_utilisateur
                then
                    nombre_emprunt := nombre_emprunt + 1
                end
                
                i := i+1
            end
            
            Result := nombre_emprunt
		end
		
	supprimer(p_emprunt : EMPRUNT) is
	    do
	        liste_emprunts.remove(liste_emprunts.index_of(p_emprunt, 0))
	    end

	delais_depasse: ARRAY[EMPRUNT] is
		local
			i:INTEGER
			emprunt_courant:EMPRUNT
			emprunt_depasse:ARRAY[EMPRUNT]
			date_retour:TIME_IN_FRENCH
			date_emprunt:TIME
		do
			create emprunt_depasse.make(0,0)
			create date_emprunt
            date_emprunt.update

			from i := 1
			until i = liste_emprunts.count
			loop
				emprunt_courant := liste_emprunts.item(i)
				date_retour := emprunt_courant.get_date_rendu
				if date_retour.time > date_emprunt then
					emprunt_depasse.add_last(emprunt_courant)
				end
				
			end
			Result := emprunt_depasse
		end

end
