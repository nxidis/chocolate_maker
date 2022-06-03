class Batch < ApplicationRecord
  belongs_to :product

  validates_presence_of :batch_date
end
