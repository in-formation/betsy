class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :qty, presence: true, numericality: {greater_than: 0}
end
