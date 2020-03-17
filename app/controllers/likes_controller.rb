class LikesController < ApplicationController

  def index
    @like_items = current_user.like_items
  end

  def create
    like = Like.new
    like.user_id = current_user.id
    like.item_id = params[:item_id]

    if like.save
      redirect_to items_path, notice: "お気に入りに登録しました"
    else
      redirect_to items_path, alert: "お気に入り登録に失敗しました"
    end
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
    redirect_to items_path, notice: "お気に入りを取り消しました"
  end
end
