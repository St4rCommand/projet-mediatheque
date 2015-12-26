class GESTIONNAIRE_MEDIAS

creation {ANY}
    nouveau

feature {NONE}

    -- Liste des médias
    liste_medias: LISTE_MEDIAS

    -- Affichage des médias
    affichage_medias: AFFICHAGE_MEDIAS
    
feature {ANY}

    -- Constructeur
    nouveau is
        do
            create liste_medias.nouveau
            create affichage_medias
        end

    -- Ajouter des médias dans la liste existante
    ajouter_liste(p_medias:ARRAY[MEDIA]) is
        do
            liste_medias.ajouter_liste(p_medias)
        end
    
    -- Ajouter un média
    ajouter is
        local
            choix : INTEGER
            continuer: BOOLEAN
        do
            continuer := True
            
            from
            until not continuer
            loop
            
                creer_media
                
                affichage_medias.afficher_ajout_suivant
                choix := affichage_medias.saisir_choix_menu(1)
                
                if choix = 0 then
                    continuer := False
                end
            
            end
            
        end

    -- Rechercher un média dans la liste des médias proposés
    consulter is 
        local
            medias: ARRAY[MEDIA]
            choix_consultation: INTEGER
            choix_continuer: INTEGER
        do
            choix_consultation := -1
            choix_continuer := -1
            create medias.make(0,0)
        
            -- Rechercher jusqu'à fin
            from
            until choix_continuer = 0
            loop
                choix_continuer := -1
            
                -- Rechercher un média                
                medias.copy(rechercher)
                
                -- Consulter un média jusqu'à fin ou nouvelle recherche
                from
                until medias /= Void and (choix_continuer = 0 or choix_continuer = 1)
                loop
                
                    affichage_medias.afficher_recherche_resultats(medias)
                    choix_consultation := affichage_medias.saisir_media_selectionne(medias.count)
                    
                    if choix_consultation = 0 then
                        choix_continuer := 1 
                    else
                        affichage_medias.afficher_media(medias.item(choix_consultation))

                        -- Séléctionner action suivante
                        affichage_medias.afficher_consultation_suivante
                        choix_continuer := affichage_medias.saisir_choix_menu(2)
                    end
                end
            end
            
        end
        
    modifier is
        local
        do
        end
        
feature {NONE}

            
    rechercher: ARRAY[MEDIA] is
        local
            choix_recherche: INTEGER
            resultat_recherche: ARRAY[MEDIA]
        do
            create resultat_recherche.make(0,0)
        
            choix_recherche := -1
        
            affichage_medias.afficher_recherche_debut
            
            affichage_medias.afficher_recherche_menu_type
            choix_recherche := affichage_medias.saisir_choix_menu(3)
            
            inspect choix_recherche
                when 1 then
                    resultat_recherche.copy(rechercher_dvd)
                when 2 then
                    resultat_recherche.copy(rechercher_livres)
                when 3 then
                    resultat_recherche.copy(rechercher_medias)
            end
            
            Result := resultat_recherche
            
            affichage_medias.afficher_recherche_fin
            
        end
        
    rechercher_dvd: ARRAY[MEDIA] is
        local
            titre: STRING
            annee: INTEGER
            realisateur: STRING
            acteur: STRING
        do
            create titre.make_from_string(affichage_medias.saisir_titre)
            annee := affichage_medias.saisir_annee
            create realisateur.make_from_string(affichage_medias.saisir_realisateur)
            create acteur.make_from_string(affichage_medias.saisir_acteur)
            Result := liste_medias.rechercher_dvd(titre, annee, realisateur, acteur)
        end
    
    rechercher_livres: ARRAY[MEDIA] is
        local
            titre: STRING
            auteur: STRING
        do
            create titre.make_from_string(affichage_medias.saisir_titre)
            create auteur.make_from_string(affichage_medias.saisir_auteur)
            Result := liste_medias.rechercher_livre(titre, auteur)
        end
    
    rechercher_medias: ARRAY[MEDIA] is
        local
            titre: STRING
        do
            create titre.make_from_string(affichage_medias.saisir_titre)
            Result := liste_medias.rechercher(titre)
        end

    creer_dvd is
        local
            titre: STRING
            annee: INTEGER
            type: STRING
            realisateurs: ARRAY[STRING]
            acteurs: ARRAY[STRING]
            continuer: INTEGER
            nombre: INTEGER
            dvd: DVD
            
        do
            create titre.make_from_string(affichage_medias.saisir_titre)
            annee := affichage_medias.saisir_annee
            create type.make_from_string(affichage_medias.saisir_type_dvd)
            nombre := affichage_medias.saisir_nombre
            create realisateurs.make(0,0)
            create acteurs.make(0,0)
            
            continuer:=1
            from
            until continuer = 0
            loop
                realisateurs.add_last(affichage_medias.saisir_realisateur)
                affichage_medias.afficher_saisir_autre_realisateur
                continuer := affichage_medias.saisir_choix_menu(1)
            end
            
            continuer:=1
            from
            until continuer = 0
            loop
                acteurs.add_last(affichage_medias.saisir_acteur)
                affichage_medias.afficher_saisir_autre_acteur
                continuer := affichage_medias.saisir_choix_menu(1)
            end
            
            create dvd.nouveau_dvd(titre, annee, type, nombre, realisateurs, acteurs)
            
            liste_medias.ajouter(dvd)
        end
        
    creer_livre is
        local
            titre: STRING
            auteur: STRING
            nombre: INTEGER
            livre: LIVRE
        do
            create titre.make_from_string(affichage_medias.saisir_titre)
            create auteur.make_from_string(affichage_medias.saisir_auteur)
            nombre := affichage_medias.saisir_nombre
            create livre.nouveau_livre(titre,auteur,nombre)
            liste_medias.ajouter(livre)
        end
        
    creer_media is
        local
            choix_menu: INTEGER
        do
            affichage_medias.afficher_creer_menu_type
            choix_menu := affichage_medias.saisir_choix_menu(2)
            
            inspect choix_menu
                when 1 then
                    creer_dvd
                when 2 then
                    creer_livre
            end
            
        end
end
