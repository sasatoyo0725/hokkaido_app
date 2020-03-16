class Users::ItemsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @items = @user.items.all
  end
end
