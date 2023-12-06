# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
first_user = User.create(name: 'Anyars Yussif')
second_user = User.create(name: 'Yussif Gariba')
third_user = User.create(name: 'Gariba Sayibu')
fourth_user = User.create(name: 'Salamatu Issahaku')
fifth_user = User.create(name: 'Issahaku Ibrahim')

# Foods
first_food = Food.create(name:'Fried Rice', measurement_unit: 'kg', price: 25, quantity: 2, user_id: first_user.id)
second_food = Food.create(name:'Jollof Rice', measurement_unit: 'ml', price: 30, quantity: 4, user_id: fourth_user.id)
third_food = Food.create(name:'Banku', measurement_unit: 'kg', price: 35, quantity: 1, user_id: second_user.id)
fourth_food = Food.create(name:'Fufu', measurement_unit: 'kg', price: 25, quantity: 3, user_id: first_user.id)
fifth_food = Food.create(name:'Pizza', measurement_unit: 'g', price: 55, quantity: 5, user_id: third_user.id)
sixth_food = Food.create(name:'Fried Rice', measurement_unit: 'kg', price: 25, quantity: 2, user_id: third_user.id)
seventh_food = Food.create(name:'Jollof Rice', measurement_unit: 'ml', price: 30, quantity: 4, user_id: first_user.id)
eighth_food = Food.create(name:'Banku', measurement_unit: 'kg', price: 35, quantity: 1, user_id: second_user.id)
nineth_food = Food.create(name:'Fufu', measurement_unit: 'kg', price: 25, quantity: 3, user_id: second_user.id)
tenth_food = Food.create(name:'Pizza', measurement_unit: 'g', price: 55, quantity: 5, user_id: fourth_user.id)

# Recipes
recipe_1 = Recipe.create(name: 'recipe 1', preparation_time: 2, cooking_time: 3, description: 'Very sweet', public: false, user_id: first_user.id)
recipe_2 = Recipe.create(name: 'recipe 2', preparation_time: 3.5, cooking_time: 4, description: 'Superb', public: true, user_id: third_user.id)
recipe_3 = Recipe.create(name: 'recipe 3', preparation_time: 1.5, cooking_time: 3, description: 'Excellent', public: false, user_id: first_user.id)
recipe_4 = Recipe.create(name: 'recipe 4', preparation_time: 2, cooking_time: 5, description: 'Very Foreign', public: false, user_id: second_user.id)
recipe_5 = Recipe.create(name: 'recipe 5', preparation_time: 4, cooking_time: 1, description: 'Very Local', public: true, user_id: fourth_user.id)
recipe_6 = Recipe.create(name: 'recipe 6', preparation_time: 2, cooking_time: 3, description: 'Very sweet', public: false, user_id: first_user.id)
recipe_7 = Recipe.create(name: 'recipe 7', preparation_time: 3.5, cooking_time: 4, description: 'Superb', public: true, user_id: third_user.id)
recipe_8 = Recipe.create(name: 'recipe 8', preparation_time: 1.5, cooking_time: 3, description: 'Excellent', public: false, user_id: first_user.id)
recipe_9 = Recipe.create(name: 'recipe 9', preparation_time: 2, cooking_time: 5, description: 'Very Foreign', public: false, user_id: second_user.id)
recipe_10 = Recipe.create(name: 'recipe 10', preparation_time: 4, cooking_time: 1, description: 'Very Local', public: true, user_id: fourth_user.id)

# Recipe Foods
first_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_1.id, food_id: first_food.id)
second_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_3.id, food_id: third_food.id)
third_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_5.id, food_id: tenth_food.id)
fourth_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_1.id, food_id: eighth_food.id)
fifth_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_9.id, food_id: first_food.id)
sixth_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_10.id, food_id: fourth_food.id)
seventh_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_4.id, food_id: eighth_food.id)
eigth_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_8.id, food_id: third_food.id)
nineth_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_6.id, food_id: tenth_food.id)
tenth_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_3.id, food_id: eighth_food.id)
eleventh_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_4.id, food_id: first_food.id)
twelveth_recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe_10.id, food_id: second_food.id)
