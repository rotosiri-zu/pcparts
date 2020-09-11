class CommentsController <  ApplicationController
  
  def create
    @comment = Comment.find(params[:post][:post_id])
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '口コミを投稿しました'
      redirect_to @posts
    else
      flash.now[:danger] = '口コミの投稿に失敗しました'
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:rate, :content, :post_id)
  end
end