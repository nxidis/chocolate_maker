class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.string :batch_number
      t.date :batch_date
      t.date :best_by_date
      t.integer :quanity
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
    add_index :batches, :id, unique: true
  end
end
