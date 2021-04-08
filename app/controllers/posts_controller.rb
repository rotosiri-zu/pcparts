class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_posts, only: %i[show edit update destroy]
  
  def index
    @number = 26
    @posts = Post.order("created_at DESC").limit(@number)
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
      flash[:danger] = 'アイテムを登録できませんでした、記入項目を確認してください'
      render :new
    end
  end

  def show
    @displaynumber = 10
    @number = 26
    @comments = @posts.comments.order('created_at DESC').limit(@displaynumber).page(params[:page]).per(@number)
    @comment = @posts.comments.new
  end

  def edit
  end
  
  def update
    if @posts.user_id == current_user.id
      @posts.update(post_params)
      if @posts.save
        flash[:success] = 'アイテムを更新しました'
        redirect_to root_path
      else
        flash[:danger] = 'アイテムの更新に失敗しました 記入項目を確認してください'
        render :edit
      end
    end
  end

  def destroy
    if @posts.user_id == current_user.id
      flash[:success] = 'アイテムを削除しました'
      @posts.destroy
      redirect_to root_path
    end  
  end

  private
  
  def post_params
    params.require(:post).permit(
      :image,
      :title,
      :price,
      :text,
      :category_id
    ).merge(user_id: current_user.id)
  end

  def set_posts
    @posts = Post.find(params[:id])
  end
end  