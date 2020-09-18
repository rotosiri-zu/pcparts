class CommentsController <  ApplicationController
  before_action :correct_user, only: %i[edit update]
  before_action :set_comment, only: %i[edit update destroy]
  def create
    @comments = Comment.create(comment_params)
    if @comments.save
      flash[:success] = '口コミを投稿しました'
      redirect_to root_path
    else
      flash.now[:danger] = '口コミの投稿に失敗しました'
      render 'posts/show'
    end
  end

  def edit
  end

  def update
    if @posts.user_id == current_user.id
      @comment.update(comment_params)
      if @comment.save
        flash[:success] = '口コミを更新しました'
        redirect_to root_path
      else
        flash.now[:danger] = '口コミの編集に失敗しました'
        render :edit
      end
    end
  end
  
  def destroy
    return unless @comment.destroy

    flash[:success] = '口コミを削除しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :rate, :content).merge(post_id: params[:post_id], user_id: current_user.id)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end