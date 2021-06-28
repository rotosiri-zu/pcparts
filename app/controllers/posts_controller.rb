class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_posts, only: %i[show edit update destroy]
  before_action :set_displaynumber, only: %i[index show]
  before_action :set_pagenumber, only: %i[index show]

  def index
    @posts = Post.order("id DESC").limit(@displaynumber)
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
    if @posts.save
      flash[:success] = "アイテムを登録しました"
      redirect_to root_path
    else
      flash[:danger] = "アイテムを登録できませんでした、記入項目または既に同じアイテムが投稿されています"
      render :new
    end
  end

  def show
    @comments = @posts.comments.order("created_at DESC").page(params[:page]).per(@pagenumber)
    @comment = @posts.comments.new
  end

  def edit
  end

  def update
    if @posts.update!(post_params)
      flash[:success] = "アイテムを更新しました"
      redirect_to root_path
    else
      flash[:danger] = "アイテムの更新に失敗しました 記入項目を確認してください"
      render :edit
    end
  end

  def destroy
    if @posts.user_id == current_user.id
      flash[:success] = "アイテムを削除しました"
      @posts.destroy!
      redirect_to root_path
    end
  end

  private

    def post_params
      params.require(:post).permit(
        :image_url,
        :title,
        :price,
        :text,
        :category_id,
      ).merge(user_id: current_user.id)
    end

    def set_posts
      @posts = Post.find(params[:id])
    end

    def set_displaynumber
      @displaynumber = 15
    end

    def set_pagenumber
      @pagenumber = 26
    end
end
