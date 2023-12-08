class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
      @foods = current_user.foods
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
    @missing_foods = current_user.foods - current_user.recipes.joins(:foods).pluck(:food_id).uniq
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
