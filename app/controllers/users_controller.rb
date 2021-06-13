class UsersController < ApplicationController
  before_action :set_user

  def show
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
