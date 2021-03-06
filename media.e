deferred class MEDIA

feature {NONE}

    -- Titre du média
    titre: STRING
    
    --Nombre d'exemplaires du média
    nombre: INTEGER
    
feature {ANY}

    -- Constructeur vide
    nouveau is
        deferred
        end

    -- Set titre
    set_titre (p_titre: STRING) is
        require
            p_titre.count > 0
        do
            titre := p_titre
        end

    -- Set nombre
    set_nombre (p_nombre: INTEGER) is
        require
            p_nombre >= 0
        do
            nombre := p_nombre
        end

    -- Get titre
    get_titre: STRING is
        do
            Result := titre
        end

    -- Get nombre
    get_nombre: INTEGER is
        do
            Result := nombre
        end

    -- To string
    to_string: STRING is
        do
            Result := titre + " (" + nombre.to_string + "exemplaires)"
        end
        
    -- Ajouter un exemplaire
    ajouter_exemplaire(p_nombre: INTEGER) is
        do
            nombre := p_nombre + nombre
        end
        
    -- Comparaison
    standard_equal(p_media: MEDIA): BOOLEAN is
        deferred
        end
end
