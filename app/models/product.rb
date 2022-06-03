class Product < ApplicationRecord
  belongs_to :product_type
  has_many :batches
  has_rich_text :description

  validates_uniqueness_of :product_name
  validates_length_of :product_name, within: 3..25
  validates :product_name, presence: true
  validates :shelf_life, presence: true
  validates :net_weight, presence: true

end
