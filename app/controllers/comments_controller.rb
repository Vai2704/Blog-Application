class CommentsController < ApplicationController

  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(status: true))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    if @comment.update(status: false)
      redirect_to post_path(@post), notice: "Comment status updated to false"
    else 
      redirect_to post_path(@post), alert: "Comment status not updated!"
    end

  end

  private def comment_params
    params.require(:comment).permit(:username, :content)
  end
end
