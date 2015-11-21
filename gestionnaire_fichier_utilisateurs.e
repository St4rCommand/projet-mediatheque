class GESTIONNAIRE_FICHIER_UTILISATEURS

insert
       GESTIONNAIRE_FICHIER_DONNEES

feature {ANY}
              
	-- Lecture du fichier utilisateurs.txt  
	lire_fichier_utilisateurs(fichier:STRING): ARRAY[UTILISATEUR] is
	       local
                     file_read: TEXT_FILE_READ
                     utilisateur: UTILISATEUR
                     utilisateurs: ARRAY[UTILISATEUR]
	       do
	              -- Création du tableau
	              create utilisateurs.with_capacity(0,0)
	              
	              --connexion au fichier
                     create file_read.connect_to(fichier)
	              
	              -- si le fichier existe
	              if file_read.is_connected then
	                     
	                     -- lecture jusqu'à la fin du fichier (ligne par ligne)
	                     from 
	                     until file_read.end_of_input
	                     loop
	                            file_read.read_line
	                            
	                            if not file_read.last_string.is_empty then
	                                   utilisateur := lire_utilisateur(file_read.last_string)
	                                   
	                                   if utilisateur /= Void then
	                                          utilisateurs.add_last(utilisateur)
                                          else
	                                          io.put_string("Erreur : Utilisateur non créé%N")
                                          end
                                   else
                                   
                                   end
	                     end
	              else
	                     io.put_string("Erreur : le fichier n'existe pas%N")
	              end
	              
	              if utilisateurs.is_empty then
	                     Result := Void
	              else
	                     Result := utilisateurs
	              end
	       end
	       
       -- Lecture d'un utilisateur (une ligne du fichier utilisateurs.txt)
       lire_utilisateur(string_utilisateur: STRING):UTILISATEUR is
              local
	              utilisateur: UTILISATEUR
	              identifiant: STRING
	              nom: STRING
	              prenom: STRING
	              admin: BOOLEAN
              do
              
                     -- recherche des attributs
                     create identifiant.make_from_string(lire_attribut(string_utilisateur, "Identifiant"))
                     create prenom.make_from_string(lire_attribut(string_utilisateur, "Prenom"))
                     create nom.make_from_string(lire_attribut(string_utilisateur, "Nom"))
                     
                     -- validation des contraintes
                     if identifiant.is_empty or prenom.is_empty or nom.is_empty then
                            io.put_string("Erreur : Un des attributs de l'utilisateur n'est pas présent%N")
                            Result := Void
                     else
                            -- déterminer le type d'utilisateur
                            admin := string_utilisateur.has_substring("Admin")
                            if admin then
                                   create utilisateur.nouveau(identifiant, nom, prenom)
                            else
                                   create utilisateur.nouveau(identifiant, nom, prenom)
                            end
                     end
                     
                     Result := utilisateur
              end
end
