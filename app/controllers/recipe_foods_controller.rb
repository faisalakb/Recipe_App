class RecipeFoodsController < ApplicationController
  before_action :set_recipe
  before_action :set_food, only: [:create, :new] # Include :new if needed for the new action

  def index
    @foods = Food.all
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to @recipe, notice: 'Food was successfully added to the recipe.' }
        format.js   # Handle AJAX response
      else
        format.html { render 'recipes/show' } # Adjust the path based on your actual structure
        format.js   # Handle AJAX response
      end
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_food
    @food = Food.find(params[:food_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
  
end
