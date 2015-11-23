class MEDIATHEQUE

creation {ANY}
	make
	
feature {}
       utilisateurs:ARRAY[UTILISATEUR]
       medias:ARRAY[MEDIA]
       gestionnaire_fichier_utilisateurs:GESTIONNAIRE_FICHIER_UTILISATEURS
       gestionnaire_fichier_medias:GESTIONNAIRE_FICHIER_MEDIAS

feature {ANY}
	
    -- Constructeur
	make is
        local
            utilisateurs_lus: ARRAY[UTILISATEUR]
            --medias_lus: ARRAY[MEDIA]
		do
            create gestionnaire_fichier_utilisateurs
            create gestionnaire_fichier_medias
            io.put_string("Bienvenue à la médiathèque%N")

            create utilisateurs_lus.from_collection(gestionnaire_fichier_utilisateurs.lire_fichier_utilisateurs("utilisateurs.txt"))                
            io.put_string("Nombre d'utilisateurs créés : "+utilisateurs_lus.count.to_string+"%N")
            --across utilisateurs_lus as utilisateur 
            --loop 
            --    io.put_string("  "+utilisateur.to_string+"%N")
            --end
            --from not utilisateurs_lus.is_empty
            --until
            --loop
                --io.put_string("  "+utilisateurs_lus..to_string+"%N")
            --end
            
            gestionnaire_fichier_medias.lire_fichier_medias("medias.txt")          
            --io.put_string("Nombre de médias créés : "+medias_lus.count.to_string+"%N")
        end
		
    ajouter_utilisateurs (nouveaux_utilisateurs : ARRAY[UTILISATEUR]) is
        do
        end
	
		

end
