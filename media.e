class MEDIA

creation {ANY}
	make

feature {ANY}
	
	-- Constructeur
	make is
		do
			io.put_string("Constructeur média")
		end
		
feature {MEDIATHEQUE}
	coucou is
	       do 
	              io.put_string("Coucou depuis média")
	       end
end
