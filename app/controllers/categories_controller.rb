class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params    
    if @category.save
      flash[:success] = I18n.t "category_success"
      redirect_to @category
    else
      render "new"
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :image
  end
end