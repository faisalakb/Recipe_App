# app/models/inventory_food.rb
class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food
end
