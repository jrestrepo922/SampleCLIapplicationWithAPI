#the model. Drink objects 
class Drink
    attr_accessor :name, :drink_id, :ingredient, :instructions

    @@all = []

    def initialize(name:, drink_id:, ingredient:)
        @name = name 
        @drink_id = drink_id
        @ingredient = ingredient
        @@all  << self 
    end 

    def self.all
        @@all 
    end 

    # will find drinks based on an ingredient. It the user looks for drinks with sugar, rum and tequila many object will be created and one way to filter through them is by ingredient
    def self.find_by_ingredient(ingredient) 
        @@all.select {|drink| drink.ingredient == ingredient}
    end 
end 