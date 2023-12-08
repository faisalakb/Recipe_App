class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @is_active = true
    # @foods = current_user.foods
    if params[:id] == 'missing_foods'
      missing_foods
      render :missing_foods
    else
      @foods = Food.all
    end
  end

  def show
    if params[:id] == 'missing_foods'
      missing_foods
      render :missing_foods
    else
      @food = Food.find(params[:id])
    end
  end

  def new
    @food = Food.new
  end

  def missing_foods
    # Preload the foods association for current_user.recipes
    recipes_with_foods = current_user.recipes.includes(:foods)

    # Extract all food_ids from recipes
    food_ids_from_recipes = recipes_with_foods.flat_map { |recipe| recipe.foods.pluck(:id) }

    # Find missing foods that are not present in recipes
    @missing_foods = current_user.foods.where.not(id: food_ids_from_recipes)

    @total_items = @missing_foods.count
    @total_price = @missing_foods.sum(&:price)
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if current_user == @food.user
      @food.destroy
      redirect_to foods_path, notice: 'Food was successfully deleted.'
    else
      redirect_to foods_path, alert: 'You are not authorized to delete this food.'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
