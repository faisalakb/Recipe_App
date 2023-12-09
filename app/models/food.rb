class Food < ApplicationRecord
  belongs_to :user

  has_many :inventory_foods, dependent: :destroy
  validates :user_id, presence: true

  has_many :inventories, through: :inventory_foods
end
