
require 'open-uri'

puts 'clearing database ....'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Rebuilding database ... '

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized = open(url).read

ingredients = JSON.parse(serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!({ name: ingredient['strIngredient1'] })
  puts "Added #{ingredient['strIngredient1']}"
end

10.times.Cocktail.create! do
  ({ name: Faker::FunnyName.name })
end

puts 'Done!'
