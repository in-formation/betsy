class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def show
    product_id = params[:id].to_i
    @product = Product.find_by(id: product_id)
    if @product.nil?
      flash[:status] = :error
      flash[:result_text] = "Product not found"
      redirect_to products_path
    end
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:status] = :success
      flash[:result_text] = "#{@product.name} successfully saved!"
      redirect_to product_path(@product.id)
    else
      flash.now[:status] = :error
      flash.now[:result_text] = "Product not successfully saved"
      render new_product_path
    end
  end
  
  def edit
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      flash[:status] = :error
      flash[:result_text] = "That product does not exist"
      redirect_to products_path
      return
    end
  end
  
  def update
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      flash[:status] = :error
      flash[:result_text] = "That product does not exist"
      redirect_to products_path
      return
    elsif @product.update(product_params)
      flash[:status] = :success
      flash[:result_text] = "#{@product.name} successfully updated!"
      redirect_to product_path(@product.id)
      return
    else
      flash.now[:status] = :error
      flash.now[:result_text] = "#{@product.name} not successfully updated!"
      render :edit
    end
  end
  
  private
  def product_params
    return params.require(:product).permit(:name, :qty, :price, :description, :status)
  end
end
