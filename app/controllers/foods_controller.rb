class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
