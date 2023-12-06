class InventoryFood < ApplicationRecord
  belongs_to :inventory
  has_many :food
end
