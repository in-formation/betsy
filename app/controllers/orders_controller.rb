class OrdersController < ApplicationController
  skip_before_action :require_login, only: [:cart]
  
  
  def cart
    @items = @current_order.order_items 
  end
  
  def show
    @order = Order.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
    @items = @order.order_items.map { |item| item.user_id == @user.id }
  end
  
  def edit
    @order = Order.find_by(id: params[:id])
  end
  
  def update
    @order = Order.find_by(id: params[:id])
    
    if @order.update(status: params[:status])
      flash[:status] = :success
      flash[:result_text] = "Successfully updated status!"
      redirect_to order_path(@order.id)
    else
      flash[:status] = :error
      flash[:result_text] = "A problem occured: Could not update order status"
      redirect_to order_path(@order.id)
    end
  end
  
end
