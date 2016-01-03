class GESTIONNAIRE_EMPRUNTS

creation {ANY}
    nouveau
    
feature {NONE}

    -- Liste des médias
    liste_emprunts: LISTE_EMPRUNTS

    -- Affichage des médias
    affichage_emprunts: AFFICHAGE_EMPRUNTS
    
feature {ANY}

    nouveau is
        do
            create liste_emprunts.nouveau
            create affichage_emprunts
        end
   
    ajouter is
        local
            emprunts: ARRAY[EMPRUNT]
            emprunt: EMPRUNT
        do
            create emprunts.make(0,0)
        
        end
        
    rendre is
        do
        
        end   
        
end
