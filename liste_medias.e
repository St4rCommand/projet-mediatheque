class LISTE_MEDIAS

creation {ANY}
    nouveau

feature {NONE}
    -- Liste des médias
    liste_medias: ARRAY[MEDIA]
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
			-- création de la liste des médias à nulle
            create liste_medias.make(0,0)
        end

    -- Ajouter un média dans la mémoire
    ajouter(p_media: MEDIA) is
        local
            i: INTEGER
            exist: BOOLEAN
        do
            exist := False
        
            from i:=1
            until i = liste_medias.count
            loop
                
                
                if liste_medias.item(i).standard_equal(p_media) then
                    liste_medias.item(i).ajouter_exemplaire(p_media.get_nombre)
                    exist := True
                end
                
                i := i+1
            end
            
			-- Ajout du média en fin de la liste des médias existante
			if not exist then
                liste_medias.add_last(p_media)
            end
        end
        
    -- Ajouter un ensemble de médias
    ajouter_liste(p_medias: ARRAY[MEDIA]) is
        local
            i: INTEGER
        do
            from i:= 1
            until i = p_medias.count
            loop
                ajouter(p_medias.item(i))
                i := i+1
            end
        end

    -- Rechercher : retourne la liste des médias de la médiathèque
    rechercher(p_titre:STRING): ARRAY[MEDIA] is
        local
            medias_trouves: ARRAY[MEDIA]
            i: INTEGER
        do
            create medias_trouves.make(0,0)
            
            from i:=1
            until i = liste_medias.count
            loop
                if liste_medias.item(i).get_titre.as_lower.has_substring(p_titre.as_lower) then
                    medias_trouves.add_last(liste_medias.item(i))
                end
                
                i := i+1
            end
            
            Result := medias_trouves
        end
        
    rechercher_dvd(p_titre: STRING; p_annee: INTEGER; p_realisateur: STRING; p_acteur:STRING): ARRAY[MEDIA] is
        local
            dvd_trouves: ARRAY[MEDIA]
            dvd_courant: DVD
            i: INTEGER
        do
            create dvd_trouves.make(0,0)
            
            from i:=1
            until i = liste_medias.count
            loop
                dvd_courant ?= liste_medias.item(i)
                
                if dvd_courant /= Void
                and then dvd_courant.get_titre.as_lower.has_substring(p_titre.as_lower) 
                and then dvd_courant.has_realisateur(p_realisateur)
                and then dvd_courant.has_acteur(p_acteur)
                and then dvd_courant.has_annee(p_annee)
                then
                    dvd_trouves.add_last(dvd_courant)
                end
                
                i := i+1
            end
            
            Result := dvd_trouves
        end
        
    rechercher_livre(p_titre: STRING; p_auteur: STRING): ARRAY[MEDIA] is
        local
            livres_trouves: ARRAY[MEDIA]
            livre_courant: LIVRE
            i: INTEGER
        do
            create livres_trouves.make(0,0)
            
            from i:=0
            until i = liste_medias.count
            loop
                livre_courant ?= liste_medias.item(i)
                
                if livre_courant /= Void 
                and then livre_courant.get_titre.as_lower.has_substring(p_titre.as_lower) 
                and then livre_courant.get_auteur.as_lower.has_substring(p_auteur.as_lower)
                then
                    livres_trouves.add_last(livre_courant)
                end
                
                i := i+1
            end
            
            Result := livres_trouves
        end
        
    rechercher_media: ARRAY[MEDIA] is
        do
            Result := liste_medias
        end

    -- Obtenir
    --Obtenir_media:MEDIA is
    --    do
    --
    --    end
        
end
