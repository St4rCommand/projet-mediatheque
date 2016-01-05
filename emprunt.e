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
	date_debut:TIME_IN_FRENCH

feature {ANY}

    nouveau(p_utilisateur: UTILISATEUR ; p_media:MEDIA ; p_date_debut: TIME) is
        do
            utilisateur := p_utilisateur
            media := p_media
            create date_debut
            date_debut.set_short_mode(True)
            date_debut.set_time(p_date_debut)
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
    set_date_debut (p_date_debut:TIME) is
        do
            date_debut.set_time(p_date_debut)
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
    get_date_debut: TIME_IN_FRENCH is
        do
            Result := date_debut
        end
        
    get_date_rendu(delai_emprunt_media: INTEGER): TIME_IN_FRENCH is
        local
            date_rendu: TIME_IN_FRENCH
            date: TIME
        do
            create date_rendu
            create date
            date.copy(date_debut.time)
            date.add_day(7*delai_emprunt_media)
            date_rendu.set_time(date)
            date_rendu.set_short_mode(True)
            
            Result := date_rendu
        end
        
	to_string: STRING is
        do 
            Result := utilisateur.to_string+ " emprunte "+media.to_string
        end
end
