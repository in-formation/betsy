class User < ApplicationRecord
  has_many :products
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  def self.build_from_github(auth_hash)
    user = User.new
    user.uid = auth_hash[:uid]
    user.provider = "github"
    user.name = auth_hash["info"]["nickname"]
    user.email = auth_hash["info"]["email"]
    return user
  end
  
  def total_revenue
    orders = Order.where('status = ?', 'paid')
  end
end
