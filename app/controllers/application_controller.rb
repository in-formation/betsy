class ApplicationController < ActionController::Base
  before_action :current_order

  def current_order
    if session[:order_id]
      @current_order = Order.find_by(id: session[:order_id])
    else
      @current_order = Order.create
      session[:order_id] = @current_order.id
    end
  end
end
