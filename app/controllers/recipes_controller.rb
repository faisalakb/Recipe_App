class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @recipes = Recipe.includes(:foods).all
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
    @recipe = Recipe.includes(:foods).find(params[:id])
    @foods = @recipe.foods
    @inventories = Inventory.all
  end
  

  def public_list
    @public_recipes = Recipe.includes(:foods).where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
  end
end
