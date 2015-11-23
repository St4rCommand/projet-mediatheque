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
	
	-- Constructeur
	nouveau(p_identifiant: STRING; p_nom: STRING; p_prenom: STRING) is
        require
            -- identifiant unique
        local
		do
			create identifiant.make_from_string(p_identifiant)
			create nom.make_from_string(p_nom)
			create prenom.make_from_string(p_prenom)
		end
		
	to_string: STRING is
        do 
            Result := identifiant+" ("+prenom+" "+nom+")"
        end
end
