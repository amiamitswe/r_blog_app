class CategoriesController < ApplicationController
  before_action :get_category, only: [:show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 2)
  end

  def show

  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)
    if @categories.save
      flash[:notice] = "Category create success"
      redirect_to @categories
    else
      render "new"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def get_category
    @category = Category.find(params[:id])
  end
end