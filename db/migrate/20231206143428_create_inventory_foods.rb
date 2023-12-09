# Example migration file for inventory_foods
class CreateInventoryFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
<<<<<<< HEAD
      t.references :inventory, null: false
      t.references :food, null: false
=======
      t.references :inventory, foreign_key: true
      t.references :food, foreign_key: true
>>>>>>> dev
      t.timestamps
    end
  end
end
