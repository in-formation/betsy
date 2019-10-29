class Order < ApplicationRecord
  has_many :order_items
  has_many :products, through: :order_items

  validates :name, presence: true
  validates :email, format: { with: /\w+@[a-zA-z]+\.[a-zA-z]{3}/, message: "Email invalid" }
  validates :address, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }
  validates :ccnum, presence: true, numericality: { only_integer: true }, length: { is: 16 }
  validates :expdate, presence: true, format: { with: /^[0-1][0-9]\/\d{2}$/, :multiline => true, message: "MM/YY"}
  validates :ccv, presence: true, numericality: { only_integer: true }, length: { is: 3 }
  validates :status, presence: true
end
