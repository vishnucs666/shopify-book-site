class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :category
      t.string :img
      t.integer :variants
      t.integer :qty
      t.integer :price

      t.timestamps
    end
  end
end
