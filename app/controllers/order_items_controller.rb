class OrderItemsController < ApplicationController
  skip_before_action :require_login
  
  def new
    @order_item = OrderItem.new
    @product = Product.find_by(id: params[:product_id])
  end
  
  def create
    @product = Product.find_by(id: params[:product_id])
    
      @order_item = OrderItem.new(order_item_params)
   
    
    if @order_item.save
      flash[:status] = :success
      flash[:result_text] = "Successfully added to cart!"
      redirect_to cart_path
  
    else
      flash[:status] = :error
      flash[:result_text] = "A problem occured: Could not save the item to the cart"
      redirect_to product_path(@product.id)
    end
    
  end
  
  def edit
    @order_item = OrderItem.find_by(id: params[:id])
    @order = @order_item.order
  end
  
  def update
    @order_item = OrderItem.find_by(id: params[:id])
    @order = @order_item.order
    
    if params[:qty].to_i == 0
      @order_item.destroy
      redirect_to cart_path
      if @order_item.update(order_item_params)
        flash[:status] = :success
        flash[:result_text] = "Successfully updated quantity"
        redirect_to cart_path
      else
        flash[:status] = :error
        flash[:result_text] = "A problem occurred: Could not update the quantity"
        redirect_to cart_path
      end
    end
  
  end

  def destroy
    the_correct_order_item = OrderItem.find_by(id: params[:id])
    if the_correct_order_item.nil?
      flash[:status] = :error
      flash[:result_text] = "A problem occurred: Could not remove item from cart"
      redirect_to cart_path
    else
      the_correct_order_item.destroy
      flash[:status] = :success
      flash[:result_text] = "Successfully removed product from cart"
      redirect_to cart_path
    end
    
  end
  private

  def order_item_params
    return params.require(:order_item).permit(:qty, :order_id, :product_id)
  end
end