class MEDIATHEQUE

creation {ANY}
	make
	
feature {}
       utilisateurs:ARRAY[UTILISATEUR]
       medias:ARRAY[MEDIA]
       lecteur_fichier_utilisateur:LIRE_FICHIER_UTILISATEURS

feature {ANY}
	
	-- Constructeur
	make is
	       local
	       utilisateurs_lus : ARRAY[UTILISATEUR]
	       
		do
		       
		       create lecteur_fichier_utilisateur.nouveau
			io.put_string("Bienvenue à la médiathèque%N")
			--create utilisateur.nouveau("roro","hunault","romain")
			--utilisateur.afficher
                     create utilisateurs_lus.from_collection(lecteur_fichier_utilisateur.lire_fichier_utilisateurs("utilisateurs.txt"))
                     
                     io.put_string("Nombre d'utilisateurs créés : "+utilisateurs_lus.count.to_string+"%N")
		end
		
	ajouter_utilisateurs (nouveaux_utilisateurs : ARRAY[UTILISATEUR]) is
	       do
	       
	       end
	
		

end
