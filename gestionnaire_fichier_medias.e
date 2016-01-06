class GESTIONNAIRE_FICHIER_MEDIAS

---
--- Classe pour l'interaction avec le fichier médias
---

inherit
       GESTIONNAIRE_FICHIER_DONNEES

feature {ANY}

    ---
    --- Lecture du fichier de données média
    lire_fichier_medias(fichier:STRING): ARRAY[MEDIA] is
        local
            file_read: TEXT_FILE_READ
            media: MEDIA
            medias: ARRAY[MEDIA]
        do

            -- Création du tableau des médias lus
            create medias.make(0,0)
            
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
	                                   
                        if media /= Void then
                            medias.add_last(media)
                        else
                            io.put_string("Erreur : Média non créé%N")
                        end
                    else
                                   
                    end
                end

                -- Déconnexion du fichier
                file_read.disconnect
            else
                io.put_string("Erreur : le fichier n'existe pas%N")
            end
	              
            if medias.is_empty then
                Result := Void
            else
                Result := medias
            end

        end
        
feature {NONE}
       
    ---
    --- Lecture du type de média d'une ligne
    lire_media(cdc_media: STRING): MEDIA is
        local
            type: STRING
        do
            type := cdc_media.substring(1, cdc_media.first_index_of(';')-2)

            inspect type
                when "Livre" then
                    Result := lire_livre(cdc_media)
                when "DVD" then
                    Result := lire_dvd(cdc_media)
                else
                    io.put_string("Erreur : le type de média n'a pas pu être déterminé%N")
                    Result := Void
            end
        end

    ---
    --- Lire une ligne DVD
    lire_dvd(cdc_media: STRING): DVD is
        local
            dvd : DVD
            titre: STRING
            nombre: STRING
	        annee: STRING
	        type: STRING
	        realisateurs: ARRAY[STRING]
	        acteurs: ARRAY[STRING]
        do
            create dvd.nouveau
            Result := dvd

            -- Recherche des attribut
            create titre.make_from_string(lire_attribut(cdc_media, "Titre"))
            create nombre.make_from_string(lire_attribut(cdc_media, "Nombre"))
            create annee.make_from_string(lire_attribut(cdc_media, "Annee"))
            create type.make_from_string(lire_attribut(cdc_media, "Type"))
            create realisateurs.from_collection(lire_attribut_multiple(cdc_media, "Realisateur"))
            create acteurs.from_collection(lire_attribut_multiple(cdc_media, "Acteur"))

            if not titre.is_empty then
                dvd.set_titre(titre)
            else
                io.put_string("Erreur : Le titre n'a pas pu être déterminé.%N")
                Result := Void
            end
            
            if Result /= Void and annee.is_integer then
                dvd.set_annee(annee.to_integer)
            else
                io.put_string("Erreur : L'annee n'a pas pu être déterminé.%N")
                Result := Void
            end
           
            if Result /= Void and not type.is_empty then
                dvd.set_type(type)
            else
            end
           
            if Result /= Void and nombre.is_integer then
                dvd.set_nombre(nombre.to_integer)
            else
            end
            
            if Result /= Void and realisateurs.count > 0 then
                dvd.add_realisateurs(realisateurs)
            else
                io.put_string("Erreur : Aucun réalisateur n'a pu être lu.%N")
                Result := Void
            end
            
            if Result /= Void and acteurs.count > 0 then
                dvd.add_acteurs(acteurs)
            else
                io.put_string("Erreur : Aucun acteur n'a pu être lu.%N")
                Result := Void
            end
            
        end        

    ---
    --- Lire une ligne Livre
    lire_livre(cdc_media: STRING): LIVRE is
        local
            livre: LIVRE
            titre: STRING
            nombre: STRING
	        auteur: STRING
        do
            create livre.nouveau
            Result := livre

            -- Recherche des attribut
            create titre.make_from_string(lire_attribut(cdc_media, "Titre"))
            create nombre.make_from_string(lire_attribut(cdc_media, "Nombre"))
            create auteur.make_from_string(lire_attribut(cdc_media, "Auteur"))

            
            if not titre.is_empty then
                livre.set_titre(titre)
            else
                io.put_string("Erreur : Le titre n'a pas pu être déterminé.%N")
                Result := Void
            end
            
            if Result /= Void and not auteur.is_empty then
                livre.set_auteur(auteur)
            else
                io.put_string("Erreur : L'auteur n'a pas pu être déterminé.%N")
                Result := Void
            end
           
            if Result /= Void and nombre.is_integer then
                livre.set_nombre(nombre.to_integer)
            else
            end
        end
end
