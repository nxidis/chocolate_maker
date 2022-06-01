class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :shelf_life
      t.string :sku
      t.float :net_weight
      t.float :shipping_weight
      t.text :description

      t.timestamps
    end
    add_index :products, :product_name, unique: true
    add_index :products, :sku, unique: true
  end
end
