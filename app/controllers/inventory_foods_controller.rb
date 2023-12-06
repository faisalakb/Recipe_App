class InventoryFoodsController < ApplicationController
  before_action :set_inventory
  before_action :set_inventory_food, only: [:update, :destroy]

  def index
    @inventory_foods = @inventory.inventory_foods
  end

  def create
    @inventory_food = @inventory.inventory_foods.build(inventory_food_params)
    if @inventory_food.save
      redirect_to inventory_inventory_foods_path(@inventory), notice: 'Inventory food was successfully added.'
    else
      render :index
    end
  end

  def update
    if @inventory_food.update(inventory_food_params)
      redirect_to inventory_inventory_foods_path(@inventory), notice: 'Inventory food quantity was successfully updated.'
    else
      render :index
    end
  end

  def destroy
    @inventory_food.destroy
    redirect_to inventory_inventory_foods_path(@inventory), notice: 'Inventory food was successfully removed.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def set_inventory_food
    @inventory_food = @inventory.inventory_foods.find(params[:id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
