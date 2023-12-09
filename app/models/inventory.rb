class Inventory < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :inventory_foods, foreign_key: 'inventory_id'
  
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods
end
