class GESTIONNAIRE_MEDIAS

---
--- Gestionnaire des médias
---

creation {ANY}
    nouveau

feature {NONE}

    -- Liste des médias
    liste_medias: LISTE_MEDIAS

    -- Affichage des médias
    affichage_medias: AFFICHAGE_MEDIAS
    
    -- Gestionnaire des emprunts
    gestionnaire_emprunts : GESTIONNAIRE_EMPRUNTS
    
feature {ANY}

    nouveau is
        do
            create liste_medias.nouveau
            create affichage_medias
        end
        
    set_gestionnaire_emprunts(p_gestionnaire_emprunts : GESTIONNAIRE_EMPRUNTS) is
        do
            gestionnaire_emprunts:=p_gestionnaire_emprunts
        end

    ---
    --- Ajouter une liste de médias
    ajouter_liste(p_medias:ARRAY[MEDIA]) is
        do
            liste_medias.ajouter_liste(p_medias)
        end
    
    ---
    --- Ajouter un média
    ajouter is
        local
            choix : INTEGER
            continuer: BOOLEAN
        do
            continuer := True
            
            from
            until not continuer
            loop
            
                creer
                
                affichage_medias.afficher_ajout_suivant
                choix := affichage_medias.saisir_choix_menu(1)
                
                if choix = 0 then
                    continuer := False
                end
            
            end
            
        end

    ---
    --- Rechercher et consulter des médias
    consulter is 
        local
            medias: ARRAY[MEDIA]
            autre_recherche: BOOLEAN
            autre_consultation: BOOLEAN
            choix_menu: INTEGER
        do
            create medias.make(0,0)
            autre_recherche := True
            autre_consultation := True
        
            -- Rechercher jusqu'à fin
            from
            until not autre_recherche
            loop
                autre_consultation := True
            
                -- Rechercher un média                
                medias := rechercher
                
                -- Consulter un média jusqu'à fin ou nouvelle recherche
                if medias /= Void and then medias.count > 1 then
                    from
                    until not autre_consultation
                    loop
                    
                        affichage_medias.afficher_recherche_resultats(medias)
                        choix_menu := affichage_medias.saisir_resultat_a_selectionne(medias.count-1)
                        
                        if choix_menu = 0 then
                            autre_consultation := False
                        else
                            affichage_medias.afficher_media(medias.item(choix_menu), gestionnaire_emprunts)

                            -- Séléctionner action suivante
                            affichage_medias.afficher_consultation_suivante
                            choix_menu := affichage_medias.saisir_choix_menu(2)
                            
                            inspect choix_menu
                                when 1 then
                                    autre_consultation := False
                                when 2 then
                                when 0 then
                                    autre_consultation := False
                                    autre_recherche := False
                            end
                        end
                    end
                else
                    
                    if medias /= Void then
                        affichage_medias.afficher_recherche_incorrecte
                    else
                        autre_recherche := False
                    end
                    
                end
            end
            
        end
        
    ---
    --- Mettre à jour des médias
    mettre_a_jour is
        local
            autre_recherche: BOOLEAN
            autre_modification: BOOLEAN
            medias_trouves: ARRAY[MEDIA]
            choix_menu: INTEGER
        do
            autre_recherche := True
            autre_modification := True
            create medias_trouves.make(0,0)
            
            from
            until not autre_recherche
            loop
                
                autre_modification := True
            
                -- Rechercher un média                
                medias_trouves := rechercher
                
                if medias_trouves /= Void then
                    from 
                    until not autre_modification
                    loop
                    
                        affichage_medias.afficher_recherche_resultats(medias_trouves)
                        choix_menu := affichage_medias.saisir_resultat_a_selectionne(medias_trouves.count)
                    
                        if choix_menu = 0 then
                            autre_modification := False
                        else
                            modifier(medias_trouves.item(choix_menu))
                            
                            -- Séléctionner action suivante
                            affichage_medias.afficher_consultation_suivante
                            choix_menu := affichage_medias.saisir_choix_menu(2)
                            
                            inspect choix_menu
                                when 1 then
                                    autre_modification := False
                                when 2 then
                                when 0 then
                                    autre_modification := False
                                    autre_recherche := False
                            end
                                    
                        end    
                    
                    end
                else
                     autre_recherche := False
                end
                
            end
        end

    ---
    --- Recherche une liste de médias    
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
                else
                    resultat_recherche := Void
            end
            
            Result := resultat_recherche
            
            affichage_medias.afficher_recherche_fin
            
        end
        
    ---
    --- Rechercher un média
    rechercher_media: MEDIA is
        local
            medias: ARRAY[MEDIA]
            autre_recherche: BOOLEAN
            choix_menu: INTEGER
        do
            create medias.make(0,0)
            autre_recherche := True
        
            -- Rechercher jusqu'à fin
            from
            until not autre_recherche
            loop
            
                -- Rechercher un média                
                medias := rechercher
                
                -- Consulter un média jusqu'à fin ou nouvelle recherche
                if medias /= Void and then medias.count > 1 then
                    
                    affichage_medias.afficher_recherche_resultats(medias)
                    choix_menu := affichage_medias.saisir_resultat_a_selectionne(medias.count-1)
                    
                    if choix_menu /= 0 then
                        Result := medias.item(choix_menu)
                        autre_recherche := False
                    end
                else
                    
                    if medias /= Void then
                        affichage_medias.afficher_recherche_incorrecte
                    else
                        autre_recherche := False
                    end
                    
                end
            end
        end

feature {NONE}
       
    ---
    --- Rechercher sur les dvd
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
    
    ---
    --- Recherche sur les livres
    rechercher_livres: ARRAY[MEDIA] is
        local
            titre: STRING
            auteur: STRING
        do
            create titre.make_from_string(affichage_medias.saisir_titre)
            create auteur.make_from_string(affichage_medias.saisir_auteur)
            Result := liste_medias.rechercher_livre(titre, auteur)
        end
    
    ---
    --- Recherche sur les médias
    rechercher_medias: ARRAY[MEDIA] is
        local
            titre: STRING
        do
            create titre.make_from_string(affichage_medias.saisir_titre)
            Result := liste_medias.rechercher(titre)
        end

    --- 
    --- Création d'un dvd
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
            realisateur: STRING
            acteur: STRING
            date: TIME
        do
            create titre.make_empty
            create type.make_empty
            create date
            date.update
            annee := -1
            nombre := -1
            
            from
            until not titre.is_empty
            loop
                titre := affichage_medias.saisir_titre
            end            
            
            from
            until annee /= -1 and annee > 1888 and annee < date.year
            loop
                annee := affichage_medias.saisir_annee
            end
            

            type := affichage_medias.saisir_type_dvd

            from
            until nombre > 0
            loop
                nombre := affichage_medias.saisir_nombre
            end
            
            
            create realisateurs.make(0,0)
            continuer:=1
            from
            until continuer = 0
            loop
                create realisateur.make_empty
                from
                until not realisateur.is_empty
                loop
                    realisateur := affichage_medias.saisir_realisateur
                end
                realisateurs.add_last(realisateur)
                affichage_medias.afficher_saisir_autre_realisateur
                continuer := affichage_medias.saisir_choix_menu(1)
            end
            
            create acteurs.make(0,0)
            continuer:=1
            from
            until continuer = 0
            loop
                create acteur.make_empty
                from
                until not acteur.is_empty
                loop
                    acteur := affichage_medias.saisir_acteur
                end
                
                acteurs.add_last(acteur)
                affichage_medias.afficher_saisir_autre_acteur
                continuer := affichage_medias.saisir_choix_menu(1)
            end
            
            create dvd.nouveau_dvd(titre, annee, type, nombre, realisateurs, acteurs)
            
            liste_medias.ajouter(dvd)
        end
        
    ---
    --- Création d'un livre
    creer_livre is
        local
            titre: STRING
            auteur: STRING
            nombre: INTEGER
            livre: LIVRE
        do
            create titre.make_empty
            create auteur.make_empty
            
        
            from
            until not titre.is_empty
            loop
                titre := affichage_medias.saisir_titre
            end
            
            from
            until not auteur.is_empty
            loop
                auteur := affichage_medias.saisir_auteur
            end
            
            nombre := affichage_medias.saisir_nombre

            create livre.nouveau_livre(titre,auteur,nombre)
            liste_medias.ajouter(livre)
        end
        
    ---
    --- Créer un média
    creer is
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
        
    ---
    --- Modifier un média
    modifier(p_media: MEDIA) is
        local
            livre: LIVRE
            dvd: DVD
        do
            if {LIVRE} ?:= p_media then
                livre ::= p_media
                modifier_livre(livre)
            elseif {DVD} ?:= p_media then
                dvd ::= p_media
                modifier_dvd(dvd)
            end
        end
        
    ---
    --- Modifier un livre
    modifier_livre(p_livre: LIVRE) is
        local
            titre: STRING
            auteur: STRING
            nombre: INTEGER
        do
            affichage_medias.afficher_media(p_livre, gestionnaire_emprunts)
        
            create titre.make_from_string(affichage_medias.saisir_titre)
            if not titre.is_empty then
                p_livre.set_titre(titre)
            end
            
            create auteur.make_from_string(affichage_medias.saisir_auteur)
            if not auteur.is_empty then
                p_livre.set_auteur(auteur)
            end

            from
            until nombre > 0 or nombre = -1
            loop
                nombre := affichage_medias.saisir_nombre
                if nombre > 0 and nombre < gestionnaire_emprunts.get_nombre_emprunts_media(p_livre) then
                    nombre := 0
                    affichage_medias.afficher_nombre_emprunts_superieur
                end
            end
            if nombre /= -1 then 
                p_livre.set_nombre(nombre)
            end
            
        end
       
    ---
    --- Modifier un dvd
    modifier_dvd(p_dvd: DVD) is
        local
            titre: STRING
            annee: INTEGER
            type: STRING
            realisateurs: ARRAY[STRING]
            acteurs: ARRAY[STRING]
            continuer: INTEGER
            nombre: INTEGER
            i: INTEGER
            choix_menu: INTEGER
            date: TIME
        do
            create date
            date.update
        
            affichage_medias.afficher_media(p_dvd, gestionnaire_emprunts)
            
            create titre.make_from_string(affichage_medias.saisir_titre)
            if not titre.is_empty then
                p_dvd.set_titre(titre)
            end
            
            from
            until nombre > 0 or nombre = -1
            loop
                nombre := affichage_medias.saisir_nombre
                if nombre > 0 and nombre < gestionnaire_emprunts.get_nombre_emprunts_media(p_dvd) then
                    nombre := 0
                    affichage_medias.afficher_nombre_emprunts_superieur
                end
            end
            if nombre /= -1 then 
                p_dvd.set_nombre(nombre)
            end
            
            from
            until annee /= -1 and annee > 1888 and annee < date.year
            loop
                annee := affichage_medias.saisir_annee
            end
            if annee /= -1 then
                p_dvd.set_annee(annee)
            end
            
            create type.make_from_string(affichage_medias.saisir_type_dvd)
            if not type.is_empty then
                p_dvd.set_type(type)
            end
            
            realisateurs := p_dvd.get_realisateurs
            from i:=1
            until i = realisateurs.count
            loop
                affichage_medias.afficher_modifier_dvd_menu_realisateur(realisateurs.item(i))
                choix_menu := affichage_medias.saisir_choix_menu(2)
                
                inspect choix_menu
                    when 1 then
                        realisateurs.item(i).make_from_string(affichage_medias.saisir_realisateur)
                        i := i+1
                    when 2 then
                        realisateurs.remove(i)
                    when 0 then
                        i := i+1
                end
                
            end
            
            affichage_medias.afficher_saisir_autre_realisateur
            continuer := affichage_medias.saisir_choix_menu(1)
            from
            until continuer = 0
            loop
                realisateurs.add_last(affichage_medias.saisir_realisateur)
                affichage_medias.afficher_saisir_autre_realisateur
                continuer := affichage_medias.saisir_choix_menu(1)
            end
            
            acteurs := p_dvd.get_acteurs
            from i:=1
            until i = acteurs.count
            loop
                affichage_medias.afficher_modifier_dvd_menu_acteur(acteurs.item(i))
                choix_menu := affichage_medias.saisir_choix_menu(2)
                
                inspect choix_menu
                    when 1 then
                        acteurs.item(i).make_from_string(affichage_medias.saisir_acteur)
                        i := i+1
                    when 2 then
                        acteurs.remove(i)
                    when 0 then
                        i := i+1
                end
            end
            
            affichage_medias.afficher_saisir_autre_acteur
            continuer := affichage_medias.saisir_choix_menu(1)
            from
            until continuer = 0
            loop
                acteurs.add_last(affichage_medias.saisir_acteur)
                affichage_medias.afficher_saisir_autre_acteur
                continuer := affichage_medias.saisir_choix_menu(1)
            end
        end
    
end
