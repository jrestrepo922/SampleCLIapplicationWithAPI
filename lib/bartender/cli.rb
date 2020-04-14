# Control line interface. Will handle the input and output  for the user. Is the interface for the user. All input and output goes here 

class Cli 
    def run
        puts " "
        puts "Hello ane welcome to my BARTENDING APP!"
        puts " "
        puts 'Enter an ingredient to see drinks made with it'
        puts " "
        #general rule you want to scope of your variables to small as possible to use less memory and affect less parts of your code. 
        @ingredient = gets.strip.downcase   # removes the blanks and downcases the string

        #With this ingredient I want to go into my API and find drinks made with that ingredient and Create a bunch of drink objects. 
        Api.get_drinks(@ingredient)
        

        #Puts a numerical list of all the drinks 
        self.print_drinks(Drink.all) # never make an object if you made it already. can do this check by Drink.find_by_ingredient(ingredient) class method. 


        #Tells user to provided an input base on the instructions given
        self.prompt 
        
        # base on this input different things will happen
        input = gets.strip.downcase 

        # a loop will be created and the only way to exit is by typing exit
        while input != "exit"
            if input == "list"
                print_drinks(Drink.find_by_ingredient(@ingredient)) # will provide a list of drinks of the current ingredient
            elsif input.to_i > 0 && input.to_i <= Drink.find_by_ingredient(@ingredient).length   # the input is always a string. If we want to check if is in range we need to change to integer. Verify user input.
                drink = Drink.find_by_ingredient(@ingredient)[input.to_i - 1]
                Api.get_drink_details(drink)  if !drink.instructions # so this is the second api that will get the detail of the drink. if the details do not exixt create them. if they do retrive them
                self.print_drink(drink) # will print the drink with the intructions and additional information to the user. 
            elsif input == "ingredient" 
            
            else 
                puts "I do not understand - please try again"
                    puts " "
            end 
            prompt  # once the input is ask and something is return you have prompt them again. and take the new input to be evaluated by the condition in the while loop
            input = gets.strip.downcase 
        end 
        puts " "
        puts "Good Bye!"
        

    end 

    #making all the codes below to keep the code DRY (do not repeat yourself)
    def print_drinks(drinks) # the argument here is the drink objects array. which has drink_id and drink_name
        puts " "
        puts "Here are the drinks made with #{@ingredient}: "
        drinks.each.with_index(1) {|drink, index| puts "#{index}. #{drink.name}" }  # each.with_index(1) allows the index to start at 1 
    end 

    def prompt 
        puts " "
        puts "Select a number to see the recipe, type 'list' to see the list again, 'ingredients' to select a new ingredient or 'exit' to exit"
        puts " "

    end 

    def print_drink(drink)
        puts drink.name 
        puts drink.instructions 
    end 


end 