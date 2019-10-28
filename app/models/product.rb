class Product < ApplicationRecord
  has_many :order_items
  has_many :reviews
  has_and_belongs_to_many :categories
  belongs_to :user
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {only_float: true, greater_than: 0}
  validates :qty, presence: true, numericality: {only_integer: true} 
  
  def self.spotlight
    products = Product.all.sort_by {|product| - product.created_at }
    if products
      return products[0..2]
    else
      return ["No products found"]
    end
  end
  
  def self.top5
    products = Product.where(product.reviews: != nil).sort_by {|product| - product.avg_rating }
    if products
      return products[0..4]
    else
      return ["No products found"]
    end
    
  end
  
  def avg_rating
    reviews = Review.where(product_id: self.id)
    ratings = reviews.map do |review|
      review.rating
    end
    if ratings.count > 0
      return (ratings.sum / ratings.count)
    else
      "There aren't any ratings for this product yet."
    end
  end
end
