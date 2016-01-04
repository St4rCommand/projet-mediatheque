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
	jour: INTEGER
	mois: INTEGER
	annee: INTEGER

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

    -- Set jour
    set_jour (p_jour:INTEGER) is
        do
            jour := p_jour
        end
        
    -- Set mois
    set_mois (p_mois: INTEGER) is
        do
            mois := p_mois
        end

    -- Set annee
    set_annee (p_annee: INTEGER) is
        do
            annee := p_annee
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

    -- Get jour
    get_jour: INTEGER is
        do
            Result := jour
        end
        
    -- Get mois
    get_mois: INTEGER is
        do
            Result := mois
        end

    -- Get annee
    get_annee: INTEGER is
        do
            Result := annee
        end
		
	to_string: STRING is
        do 
            Result := "emprunt ("+utilisateur.to_string+ " "+media.to_string+" "+jour.to_string+"-"+mois.to_string+"-"+annee.to_string+")"
        end
end
