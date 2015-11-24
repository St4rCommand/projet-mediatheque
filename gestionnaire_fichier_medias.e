class GESTIONNAIRE_FICHIER_MEDIAS

inherit
       GESTIONNAIRE_FICHIER_DONNEES

feature {ANY}
    --lire_fichier_medias(fichier:STRING): ARRAY[MEDIA] is
    lire_fichier_medias(fichier:STRING) is
        local
            file_read: TEXT_FILE_READ
            media: MEDIA
            medias: ARRAY[MEDIA]
        do
            -- Création du tableau des médias lus
            create medias.with_capacity(0,0)
            
            -- Connexion au fichier
            create file_read.connect_to(fichier)
            
            -- Si le fichier existe
            if file_read.is_connected then
            
                -- Lecture jusqu'à la fin du fichier (ligne par ligne)
                from 
                until file_read.end_of_input
                loop
                    file_read.read_line
	                            
                    if not file_read.last_string.is_empty then
                        media := lire_media(file_read.last_string)
	                                   
                        --if media /= Void then
                        --    medias.add_last(media)
                        --else
                        --    io.put_string("Erreur : Média non créé%N")
                        --end
                    else
                                   
                    end
                end

                -- Déconnexion du fichier
                file_read.disconnect
            else
                io.put_string("Erreur : le fichier n'existe pas%N")
            end
	              
            if medias.is_empty then
                --Result := Void
            else
                --Result := medias
            end
        end
        
feature {NONE}

    -- Lecture d'un media (une ligne du fichier medias.txt)
    lire_media(cdc_media: STRING): MEDIA is
        local
            media: MEDIA
            type: STRING
            titre: STRING
            nombre: STRING
        do
            -- Récupération du type de média
            create type.make_from_string(lire_type_media(cdc_media))
            
            -- Recherche des attribut
            create titre.make_from_string(lire_attribut(cdc_media, "Titre"))
            create nombre.make_from_string(lire_attribut(cdc_media, "Nombre"))
            
            if titre.is_empty then
                io.put_string("Erreur : Un des attributs du média n'est pas présent%N")
                Result := Void
            else
                
                if nombre.is_integer then
                    -- message d'erreur pour dire que le nombre n'a pas pu être lu
                    create media.nouveau1(titre, nombre.to_integer)
                else
                    create media.nouveau2(titre)
                end
                
                inspect type
                    when "Livre" then
                        io.put_string("Livre lu%N")
                        Result := media
                    when "DVD" then
                        io.put_string("DVD lu%N")
                        Result := media
                    else
                        io.put_string("Erreur : le type de média n'a pas pu être lu%N")
                        Result := Void
                end
            end
            
        end
        
    -- Lecture du type de média d'une ligne
    lire_type_media(cdc_media: STRING): STRING is
        local
        do
            Result := cdc_media.substring(1, cdc_media.first_index_of(';')-2)
        end
end
