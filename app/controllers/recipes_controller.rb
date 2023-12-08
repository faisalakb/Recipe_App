class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @recipes = Recipe.all
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
    @inventory = @recipe.inventory
    @inventories = Inventory.all
  end

  def associate_inventory
    @recipe = Recipe.find(params[:id])
    inventory_id = params[:inventory_id]

    if inventory_id.present?
      inventory = Inventory.find(inventory_id)
      @recipe.update(inventory: inventory)
      redirect_to inventory_path(inventory), notice: 'Inventory added to the recipe successfully!'
    else
      redirect_to @recipe, alert: 'Please select an inventory.'
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
