class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    if @category.nil?
      head :not_found
      return
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new( category_params )
    if @category.save
      redirect_to category_path(@category.id)
    else
      render new_category_path
    end
  end

  def edit
    @category = Category.find_by(id: params[:id] )
  end

  def update
    @category = Category.find_by(id: params[:id] )
    if @category.update( category_params )
      redirect_to category_path(@category.id)
    else
      render new_category_path
    end
  end

  private             

  def category_params
    return params.require(:category).permit(:name)
  end
end
