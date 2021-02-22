require 'json'
require 'open-uri'

puts "let's seed..."

Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
raw_json = open(url).read
json = JSON.parse(raw_json)

ing_array = json['drinks'].first(10)
ing_array.each do |hash|
  ingredient = hash['strIngredient1']
  Ingredient.create(name: ingredient)
end

10.times do
  url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  raw_json = open(url).read
  json = JSON.parse(raw_json)

  drink_name = json['drinks'].first['strDrink']
  photo_url = json['drinks'].first['strDrinkThumb']
  file = URI.open(photo_url)
  cocktail = Cocktail.create!(name: drink_name)
  cocktail.photo.attach(io: file, filename: "#{cocktail.name}", content_type: "image/jpg")

end

puts "all done!"
