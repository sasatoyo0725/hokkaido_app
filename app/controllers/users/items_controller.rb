class Users::ItemsController < ApplicationController
  PER = 3
  
  def index
    @user = User.find(params[:user_id])
    @items = @user.items.all.page(params[:page]).per(PER)
  end

end
