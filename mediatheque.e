class MEDIATHEQUE

creation {ANY}
	make

feature {ANY}
	
	-- Constructeur
	make is
	       local
			utilisateur: UTILISATEUR
			media: MEDIA
		do
			io.put_string("Coucou la médiathèque")

			create utilisateur.make
			create media.make
			
			utilisateur.coucou
			media.coucou
		end
end
