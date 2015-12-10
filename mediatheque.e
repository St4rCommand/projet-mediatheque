class MEDIATHEQUE

creation {ANY}
	lancement
	
feature {}
       gestionnaire_menus : GESTIONNAIRE_MENUS

feature {ANY}
	
	-- Lancement de l'application
    lancement is
        do
            -- Chargement des gestionnaires
            create gestionnaire_menus.lancement
            
            -- Menu principal
            --gestionnaire_menus.menu_principal
        end
end
