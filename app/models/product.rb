class Product < ApplicationRecord
  belongs_to :product_type
  has_rich_text :description
end
