class CommentsController <  ApplicationController
  
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

  private

  def comment_params
    params.require(:comment).permit(:title, :rate, :content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end