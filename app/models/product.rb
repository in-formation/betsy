class Product < ApplicationRecord
  has_many :order_items
  has_many :reviews
  has_and_belongs_to_many :categories
  belongs_to :user
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {only_float: true, greater_than: 0}
  validates :qty, presence: true, numericality: {only_integer: true, greater_than: 0} 
end
