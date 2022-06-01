class ChangeRelationToProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_types, :product_id
    add_column :products, :product_type_id, :integer
  end
end
