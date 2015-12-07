class UTILISATEUR
--
-- Utilisateur de la médiatèque
--
--

creation {ANY}
	nouveau
	
feature {NONE}
       -- Identifiant de l'utilisateur (pour la connexion)
       identifiant: STRING
       
       -- Nom
       nom: STRING
       
       -- Prénom
       prenom: STRING

feature {ANY}
	
	-- Constructeurs
	nouveau(p_identifiant: STRING; p_nom: STRING; p_prenom: STRING) is
        require
            -- identifiant unique
        local
		do
			create identifiant.make_from_string(p_identifiant)
			create nom.make_from_string(p_nom)
			create prenom.make_from_string(p_prenom)
		end

	 -- Set identifiant
    set_identifiant (p_identifiant: STRING) is
        do
            identifiant := p_identifiant
        end

    -- Set nom
    set_nom (p_nom: STRING) is
        do
            nom := p_nom
        end

    -- Set prenom
    set_prenom (p_prenom: STRING) is
        do
            prenom := p_prenom
        end

    -- Get identifiant
    get_identifiant: STRING is
        do
            Result := identifiant
        end

    -- Get nom
    get_nom: STRING is
        do
            Result := nom
        end

    -- Get prenom
    get_prenom: STRING is
        do
            Result := prenom
        end
		
	to_string: STRING is
        do 
            Result := identifiant+" ("+prenom+" "+nom+")"
        end
end
