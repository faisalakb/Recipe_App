# app/models/inventory_food.rb
class InventoryFood < ApplicationRecord
<<<<<<< HEAD
  belongs_to :inventory, foreign_key: 'inventory_id'
  belongs_to :food, foreign_key: 'food_id'
=======
  belongs_to :inventory
  belongs_to :food
>>>>>>> dev
end
