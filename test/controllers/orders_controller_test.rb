require "test_helper"

describe OrdersController do
  describe "logged in user" do
    
    describe "cart" do
      it "can get the cart path" do
        perform_login
        
        get cart_path
        must_respond_with :success
      end
      
    end
    
    describe "show" do
      it "can get the show path for an order" do
        perform_login
        
        order = orders(:order1)
        
        get order_path(order.id)
        
        must_respond_with :success
        
      end
      
      it "will redirect when an order doesn't exist" do
        perform_login
        
        get order_path(-12)
        
        must_respond_with :redirect
        
      end
      
    end
    
    describe "edit" do
      
      it "can get the edit page for a valid order" do
        perform_login
        order = orders(:order1)
        
        get edit_order_path(order.id)
        
        must_respond_with :success
        
        
      end
      
      it "will redirect if given an invalid order" do
        perform_login
        
        
        get edit_order_path(-12)
        
        must_respond_with :redirect
        
      end
      
      
    end
    
    
  end
  
  describe "guest user" do
    describe "cart" do
      it "can get the cart path" do
        
        get cart_path
        must_respond_with :success
      end
    end
    
    describe "show" do
      it "can't get the show path for an order" do
        
        
        order = orders(:order1)
        
        get order_path(order.id)
        
        must_respond_with :redirect 
        must_redirect_to root_path
        
      end
      
    end
    
    describe "edit" do
      
      it "can't get the edit page for a valid order" do
        
        order = orders(:order1)
        
        get order_path(order.id)
        
        must_respond_with :redirect
        
        
      end
      
      
      
    end
  end
end