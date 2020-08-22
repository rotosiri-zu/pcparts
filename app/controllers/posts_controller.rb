class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
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

    def show
      @posts = Post.find(parems[:id])
    end

    def move_to_index
      redirecto_to action: :index unless
      user_signed_in?
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