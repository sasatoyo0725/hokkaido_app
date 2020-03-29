class CategoriesController < ApplicationController
PER = 3
  def show
    @category = Category.find(params[:id])
    @items = @category.items.order(created_at: :desc).page(params[:page]).per(PER).all
  end

end
