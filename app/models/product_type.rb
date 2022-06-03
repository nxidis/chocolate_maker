class ProductType < ApplicationRecord
  has_many :products

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, within: 3..25

end
