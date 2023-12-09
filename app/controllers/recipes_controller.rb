class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @recipes = Recipe.all.includes(:foods)
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods
    Rails.logger.debug("Foods: #{@foods.inspect}")
    @recipe_food = RecipeFood.new # Added for the form to add new food
  end

  # Modified create action to handle adding food to a recipe
  def add_food
    @recipe = Recipe.find(params[:id])
    @food = Food.find(params[:recipe_food][:food_id])
    quantity = params[:recipe_food][:quantity]
  
    @recipe_food = @recipe.recipe_foods.build(food: @food, quantity: quantity)
  
    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to @recipe, notice: 'Food was successfully added to the recipe.' }
        format.js   # Add this line to handle AJAX response
      else
        format.html { render 'show' }
        format.js   # Add this line to handle AJAX response
      end
    end
  end
  

  def public_list
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
  end
end
