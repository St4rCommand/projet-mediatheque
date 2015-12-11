class MEDIA

creation {ANY}
    nouveau

feature {NONE}

    -- Titre du média
    titre: STRING
    
    --Nombre d'exemplaires du média
    nombre: INTEGER
    
feature {ANY}

    -- Constructeur vide
    nouveau is
        do
            create titre.make_empty
            nombre := 1
        end

    -- Set titre
    set_titre (p_titre: STRING) is
        do
            titre := p_titre
        end

    -- Set nombre
    set_nombre (p_nombre: INTEGER) is
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
end
