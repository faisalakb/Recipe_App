class CreateInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :inventory, null: false
      t.references :food, null: false
      t.timestamps
    end
  end
end
