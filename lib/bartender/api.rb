# will handle talking to the API and getting data. 
class Api 
 
    # will take in an ingredient and use it to obtain a list of drinks made from that ingredient from an API. 
    def self.get_drinks(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"

        # This gem will go accross the net make the request to this API. Take the Json and store it in respond.
        # This is recepy and you need to follow it.  The only thing that can get send around the internet is a string this is not useful.
        # This is why we use the JSON gem  and make it useful
        response = Net::HTTP.get(URI(url)) 
        drinks = JSON.parse(response)["drinks"] # this contains an array of drinks now 

        # We are creating new drinks using the class drinks and the arguments provided for the intialize method is each indivial drink provided by the drinks array.
        # The API class method calls many instances of Drink 
        drinks.each {|drink| Drink.new(name: drink["strDrink"], drink_id: drink["idDrink"], ingredient: ingredient)} 
    end 

    def self.get_drink_details(drink) # this is a drink object being pass. 
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink.drink_id}"
        response = Net::HTTP.get(URI(url)) 
        drink_details = JSON.parse(response)["drinks"] #passes an array with all the detials of the drink
        drink.instructions = drink_details[0]["strInstructions"]
        binding.pry
    end 
end 