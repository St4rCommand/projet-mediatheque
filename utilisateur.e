class UTILISATEUR

creation {ANY}
	make

feature {ANY}
	
	-- Constructeur
	make is
		do
			io.put_string("Constructeur utilisateur")
		end
		
feature {MEDIATHEQUE}
	coucou is
	       do 
	              io.put_string("Coucou depuis utilisateur")
	       end
end
