require "test_helper"

describe Product do
  describe "validations" do
    it "can be instantiated" do
      user = User.first
      
      product = Product.create(name: "product", price: 599.99, user_id: user.id)
      
      expect(product.valid?).must_equal true
    end
    
    it "does not create a product if name is not present" do
      user = User.first
      
      invalid_product = Product.create(name: nil, price: 599.99, user_id: user.id)
      expect(invalid_product.valid?).must_equal false
    end
    
    it "does not create a product if name is not unique" do
      user = User.first
      
      product_1 = Product.create(name: "this is a product", price: 599.99, user_id: user.id)
      product_2 = Product.create(name: "this is a product", price: 599.99, user_id: user.id)
      
      expect(product_2.valid?).must_equal false
    end
    
    it "does not create a product if price is not present" do
      user = User.first
      
      invalid_product = Product.create(name: "this is a product", price: nil, user_id: user.id)
      expect(invalid_product.valid?).must_equal false
    end
    
    it "does not create a product if price is not a float greater than 0" do
      user = User.first
      
      invalid_product = Product.create(name: nil, price: -58.54, user_id: user.id)
      expect(invalid_product.valid?).must_equal false
    end
    
    it "does not create a product if price is not a float" do
      user = User.first
      
      invalid_product = Product.create(name: nil, price: 58, user_id: user.id)
      expect(invalid_product.valid?).must_equal false
    end    
  end
  
  describe "relationships" do
    it "has a user" do
      user = User.first
      
      product = Product.create(name: "product", price: 599.99, user_id: user.id)
      
      expect(product).must_respond_to :user
      expect(product.user).must_be_kind_of User
    end
    
    # it "has a list of voting users" do
    #   product = Product.first
    #   product.votes.each do |vote|
    #     expect(vote.user_id).must_be_kind_of Integer
    #   end
    # end
    
    it "contains many categories" do
      
    end
    
    it "contains many order items" do
      
    end
    
    it "contains many reviews" do
      
    end
  end
end
