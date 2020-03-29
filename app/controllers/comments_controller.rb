class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to items_path, notice: 'コメント投稿に成功しました'
    else
      flash.now[:alert] = 'コメント投稿に失敗しました'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :item_id)
  end
end
