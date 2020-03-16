class ItemsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to user_items_path, notice: "投稿に成功しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to items_path(current_user), notice: "更新に成功しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to request.referrer || items_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:description, images: [])
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to items_path(current_user) if @item.nil?
  end

end
