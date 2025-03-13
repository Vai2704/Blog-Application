class PostController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def new
    @post = Post.new
  end

  def create    
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post created successfully!'
    else
      flash[:alert] = 'Error creating post.'
      render :new
    end
  end
 
  def view
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated successfully!'
    else
      fladefsh[:alert] = 'Error updating post.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.update(status: false)
      redirect_to root_path(@post), notice: "Post deleted successfully!"
    else
      redirect_to post_path(@post), alert: "Post not deleted!!"
    end
    
  end

  private def post_params
    params.require(:post).permit(:title, :content)
  end
end
