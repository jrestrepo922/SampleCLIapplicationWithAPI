require 'pry'
require 'httparty'
require 'json'

# enviroment.rb has a require_relative to bin/drinks which is the executable file.
# enviroment.rb provides the require gems to all the folder in bartender and links them so they can talk to one another. 
require_relative './bartender/cli'
require_relative './bartender/api'
require_relative './bartender/drink'
require_relative './bartender/ingredient'