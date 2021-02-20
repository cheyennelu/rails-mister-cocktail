require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
raw_json = open(url).read
json = JSON.parse(raw_json)

ing_array = json['drinks'].first(10)

puts "let's seed..."

Ingredient.destroy_all
Cocktail.destroy_all

ing_array.each do |hash|
  ingredient = hash['strIngredient1']
  Ingredient.create(name: ingredient)
end

10.times do
  url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  raw_json = open(url).read
  json = JSON.parse(raw_json)

  ing_array = json['drinks'].first(10)

  ing_array.each do |hash|
    drink = hash['strDrink']
    Cocktail.create!(name: drink)
  end
end

puts "all done!"
