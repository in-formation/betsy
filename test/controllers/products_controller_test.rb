require "test_helper"

describe ProductsController do
  describe "index" do 
    it "succeeds when there are products" do
      get products_path
      
      must_respond_with :success
    end
    
  end
  
  
  describe "new" do 
    it "succeeds" do
      get new_product_path
      
      must_respond_with :success
    end
    
  end
  
  describe "create" do
    it "creates a new product with valid data" do      
      user_id = User.first.id
      
      new_product = { product:  {name: "new product", price: 149.99, user_id: user_id} }
      binding.pry
      expect{ post products_path, params: new_product }.must_differ 'Product.count', 1
      
      new_product_id = Product.find_by(name: "new product").id
      
      must_respond_with :redirect
      must_redirect_to product_path(new_product_id)
      
    end
    
    it "renders bad_request and does not update the DB" do
      bad_product = { product:  {name: "", qty: 7, price: 149.99, description: "This product is new", status: "active"} }
      
      expect {
      post products_path, params: bad_product
    }.wont_change "Product.count"
    
    assert_template :new
    
  end
  
end
end
