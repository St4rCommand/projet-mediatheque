class EMPRUNT

creation {ANY}
    nouveau
--
-- Emprunt
--
	
feature {NONE}

	-- Un utilisateur
	utilisateur: UTILISATEUR
       
	-- Un media
	media: MEDIA
       
	-- Date de début
	date_debut:TIME

feature {ANY}

    nouveau(p_utilisateur: UTILISATEUR ; p_media:MEDIA) is
        do
            utilisateur := p_utilisateur
            media := p_media
        end

	 -- Set utilisateur
    set_utilisateur (p_utilisateur: UTILISATEUR) is
        do
            utilisateur := p_utilisateur
        end

    -- Set media
    set_media (p_media: MEDIA) is
        do
            media := p_media
        end

    -- Set date_debut
    set_jour (p_date_debut:TIME) is
        do
            date_debut := p_date_debut
        end
        
       -- Get utilisateur
    get_utilisateur: UTILISATEUR is
        do
            Result := utilisateur
        end

    -- Get media
    get_media: MEDIA is
        do
            Result := media
        end

    -- Get date début d'emprunt
    get_date_debut: TIME is
        do
            Result := date_debut
        end
        
	to_string: STRING is
        do 
            Result := utilisateur.to_string+ " emprunte "+media.to_string
        end
end
