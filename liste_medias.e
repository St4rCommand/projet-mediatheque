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
            create liste_medias.make(0,0)
        end

    -- Ajouter
    ajouter_media(p_media: MEDIA) is
        do
            liste_medias.add_last(p_media)
        end
        
    -- Ajouter
    ajouter_medias(p_medias: ARRAY[MEDIA]) is
        do
            io.put_string("avant : "+liste_medias.count.to_string+"%N")
            liste_medias.append_collection(p_medias)
            io.put_string("après : "+liste_medias.count.to_string+"%N")
        end

    -- Modifier
    --modifier_media is
    --    do

    --    end

    -- Rechercher
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
