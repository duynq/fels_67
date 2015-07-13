class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page], per_page: Settings.categories_per_page
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

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = I18n.t "category_updated"
      redirect_to @category
    else
      render "edit"
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = I18n.t "category_deleted"
    redirect_to categories_url
  end

  private
  def category_params
    params.require(:category).permit :name, :image
  end
end
