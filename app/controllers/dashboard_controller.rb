class DashboardController < ApplicationController
  def index
    @post = Post.page(params[:page]).per(1)
    render 'dashboard'
  end
end