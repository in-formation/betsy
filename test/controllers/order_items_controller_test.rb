require "test_helper"

describe OrderItemsController do
  describe "new" do
    it "succeeds" do
      product = products(:product_1)
      get new_product_order_item_path(product.id)

      must_respond_with :success
    end
  end

  describe "create" do
    it "creates an order item with valid data" do
      order = orders(:order1)
      # binding.pry
      session[:order_id] = order.id
      product = products(:product_1)

      order_item = { orderitem: {
        qty: 2,
        order_id: order.id,
        product_id: product.id
      }}

      expect {
        post product_order_items_path(product.id), params: order_item
      }.must_change "OrderItem.count", 1

      must_respond_with :redirect
      must_redirect_to order_path(order.id)
    end

    it "does not create an order_item when bad data given" do
    end

  end

  describe "edit" do
  end

  describe "update" do
  end

  describe "destroy" do
  end
end
