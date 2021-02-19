require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
raw_json = open(url).read
json = JSON.parse(raw_json)

ing_array = json['drinks']

puts "let's get ingredients..."

Ingredient.destroy_all

ing_array.each do |hash|
  ingredient = hash['strIngredient1']
  Ingredient.create(name: ingredient)
end


puts "all done!"
