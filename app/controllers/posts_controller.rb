class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @posts = Post.order("created_at").limit(26)
  end

  def new
    @posts = Post.new
  end

  def create
    binding.pry
    @posts = Post.create(post_params)
    if @posts.save
      flash[:success] = 'アイテムを登録しました'
      redirect_to root_path
    else
      render :new
    end  
  end

  private

  def post_params
    params.require(:post).permit(
      :image,
      :title,
      :genre,
      :price,
      :text,
    ).merge(user_id: current_user.id)
  end
end  