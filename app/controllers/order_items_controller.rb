class OrderItemsController < ApplicationController
  
  
  def new
    @order_item = OrderItem.new
    @product = Product.find_by(id: params[:product_id])
  end
  
  def create
    @product = Product.find_by(id: params[:product_id])
    
    if params[:orderitem][:qty].to_i <= @product.qty
      @order_item = OrderItem.new(qty: params[:orderitem][:qty], product_id: @product.id, order_id: @current_order.id)
    else
      flash[:status] = :error
      flash[:result_text] = "Not enough quantity in stock"
      redirect_to order_path(@current_order.id)
    end
    
    if @order_item.save
      flash[:status] = :success
      flash[:result_text] = "Successfully added to cart!"
      # @current_order.order_items << @order_item
      redirect_to order_path(@current_order.id)
      # should redirect to order_path(@order.id)
    else
      flash[:status] = :error
      flash[:result_text] = "A problem occured: Could not save the item to the cart"
      redirect_to order_path(@current_order.id)
    end
    
  end
  
  def edit
    @order_item = OrderItem.find_by(id: params[:id])
    @order = Order.find_by(id: params[:order_id])
  end
  
  def update
    @order_item = OrderItem.find_by(id: params[:id])
    @order = @order_item.order
    
    # if params[:orderitem][:qty].to_i == 0
    #   @order_item.destroy
    #   redirect_to order_path(@current_order.id)
    if @order_item.update(qty: params[:qty])
      flash[:status] = :success
      flash[:result_text] = "Successfully updated quantity"
      redirect_to order_path(@order.id)
    else
      flash[:status] = :error
      flash[:result_text] = "A problem occurred: Could not update the quantity"
      redirect_to order_path(@order.id)
    end
  end
  
  def destroy
    the_correct_order_item = OrderItem.find_by(id: params[:id])
    if the_correct_order_item.nil?
      flash[:status] = :error
      flash[:result_text] = "A problem occurred: Could not remove item from cart"
      redirect_to order_path(@current_order.id)
    else
      the_correct_order_item.destroy
      flash[:status] = :success
      flash[:result_text] = "Successfully removed product from cart"
      redirect_to order_path(@current_order.id)
    end
  end
  
end
