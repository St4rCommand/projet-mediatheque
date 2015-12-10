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
        do
			-- Ajout du média en fin de la liste des médias existante
            liste_medias.add_last(p_media)
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
            end
        end

    -- Rechercher : retourne la liste des médias de la médiathèque
    rechercher_media:ARRAY[MEDIA] is
        do
            Result := liste_medias
        end

    -- Obtenir
    --Obtenir_media:MEDIA is
    --    do
    --
    --    end
        
end
