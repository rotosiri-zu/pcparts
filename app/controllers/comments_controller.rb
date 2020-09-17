class CommentsController <  ApplicationController
  before_action :correct_user, only: %i[edit update]
  before_action :set_comments, only: %i[edit update destroy]
  def create
    @comments = Comment.create(comment_params)
    if @comments.save
      flash[:success] = '口コミを投稿しました'
      redirect_to root_path
    else
      flash.now[:danger] = '口コミの投稿に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
  end
  
  private

  def comment_params
    params.require(:comment).permit(:title, :rate, :content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
  end

  def set_comments
    @comment = Post.find(params[:id])
  end
end