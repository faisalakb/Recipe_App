class Food < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  has_many :inventory_foods, dependent: :destroy
  validates :user_id, presence: true
=======
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods
>>>>>>> dev
end
