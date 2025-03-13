class CommentsController < ApplicationController
  before_action :require_login, only: [:create]

  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(status: true))
    @comment.user = current_user

    if @comment.save()
      redirect_to post_path(@post), notice: "Comment saved!"
    else
      redirect_to post_path(@post), alert: "comment not created!"
    end
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
    params.require(:comment).permit( :content)
  end
end
