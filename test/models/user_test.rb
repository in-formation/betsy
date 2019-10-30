require "test_helper"

describe User do
  describe "validations" do
    it "can be valid" do
      is_valid = users(:valid_user).valid?
      
      assert( is_valid )
    end
    
    it "is invalid if there is no name" do
      invalid_user = users(:valid_user)
      invalid_user.name = ""
      
      is_valid = invalid_user.valid?
      
      refute( is_valid )
    end
    
    it "gives an error message if the name given is not unique" do
      invalid_user = users(:valid_user2)
      invalid_user.name = "ValidName"
      
      is_valid = invalid_user.valid?
      
      refute( is_valid )
    end
    
    it "is invalid if there is no email" do
      invalid_user = users(:valid_user)
      invalid_user.email = ""
      
      is_valid = invalid_user.valid?
      
      refute( is_valid )
    end
    
    it "gives an error message if the email given is not unique" do
      invalid_user = users(:valid_user2)
      invalid_user.email = "valid@user.org"
      
      is_valid = invalid_user.valid?
      
      refute( is_valid )
    end
  end
  
  describe "relationships" do
    it "has a product" do
      user = User.first
      
      product = Product.create(name: "product", price: 599.99, qty: 5, user_id: user.id)
      
      expect(user).must_respond_to :products
      user.products.each do |product|
        expect(product).must_be_kind_of Product
      end 
    end
  end
end
