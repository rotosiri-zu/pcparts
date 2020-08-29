class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_posts, only: %i[show edit update destroy]

  def index
    @posts = Post.all
    @posts = Post.order("created_at").limit(26)
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

  def show
  end

  def edit
  end
  
  def update
    if @posts.user_id == current_user.id
      @posts.update(set_posts)
      if @posts.save
        flash[:success] = 'アイテムを更新しました'
        redirect_to root_path
      else
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
      :genre,
      :price,
      :text
    ).merge(user_id: current_user.id)
  end

  def set_posts
    @posts = Post.find(params[:id])
  end

  def move_to_index
    redirecto_to action: :index unless
    user_signed_in?
  end

end  