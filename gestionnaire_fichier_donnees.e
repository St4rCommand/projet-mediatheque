deferred class GESTIONNAIRE_FICHIER_DONNEES

feature {NONE} 

    -- Lire un attribut d'une ligne d'un fichier
    -- Renvoie une chaine vide si l'attribut n'existe pas
    lire_attribut(ligne: STRING; attribut: STRING): STRING is
        local 
            index: INTEGER
        do
            index := ligne.first_substring_index(attribut)
                     
            if index /= 0 then
                Result := ligne.substring(ligne.index_of('<',index)+1,ligne.index_of('>',index)-1)
            else
                Result := ""
            end
        end

    -- Lire toutes les occurences d'un attribut sur une ligne
    lire_attribut_multiple(ligne: STRING; attribut: STRING): ARRAY[STRING] is
        local
            index: INTEGER
            valeurs_attribut: ARRAY[STRING]
        do
            create valeurs_attribut.with_capacity(0,0)
            index := ligne.first_substring_index(attribut)

            from
            until index = 0
            loop
                valeurs_attribut.add_last(ligne.substring(ligne.index_of('<',index)+1,ligne.index_of('>',index)-1))
                io.put_string(ligne.substring(ligne.index_of('<',index)+1,ligne.index_of('>',index)-1)+"%N")
                index := ligne.substring_index(attribut, 1)
            end

            Result := valeurs_attribut
        end
end
