=begin

def reng(n)
	a = (0..n).find_all{ |i|  i % 3 == 0 || i % 5 == 0 }
  	a.flatten.uniq.sort 
  	puts a.sum 
  	end 
  	reng(10)
=end 

  def sum_of_3_or_5_multiples(n)

  # lancement d'une boucle qui va de 0 au chiffre n EXCLU (car on est sur du strictement inférieur)

i = 0
arr = []
  while i < n   # cette boucle indente à chaque tour une variable (par exemple i)
    i += 1
      if i%3 == 0 || i%5 == 0   # si la réponse est "true", alors je rajoute la valeur de i à une somme que je retournerais en fin de fonction (mon return final).
      arr << i
      else # si la réponse est "false"…ben y a pas de else. Si i n'est pas multiple, on passe au i suivant.
      end  #fin de la boucle
  end
puts arr.sum
end


sum_of_3_or_5_multiples(10)
			
