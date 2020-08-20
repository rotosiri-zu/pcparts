class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new    
  end

  def create
    @posts = Post.create(post_params)
    if @posts.save
      flash[:success] = 'アイテムを登録しました'
      redirect_to root_path
    else
      render :new
    end  
  end

  
end  