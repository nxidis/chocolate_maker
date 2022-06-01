class CreateProductTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_types do |t|
      t.string :name
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
