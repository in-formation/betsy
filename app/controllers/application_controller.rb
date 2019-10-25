class ApplicationController < ActionController::Base
  def current_order
    if session[:order_id]
      @current_order = Order.find_by(id: session[:order_id])
    else
      # binding.pry
      @current_order = Order.create
      session[:order_id] = @current_order.id
    end
  end
end
