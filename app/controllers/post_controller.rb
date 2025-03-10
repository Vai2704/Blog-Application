class PostController < ApplicationController
  before_action :set_post, only: [:view, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create    
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post created successfully!'
    else
      flash[:alert] = 'Error creating post.'
      render :new
    end
  end

  def view
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated successfully!'
    else
      flash[:alert] = 'Error updating post.'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post deleted successfully!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Post not found."
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
