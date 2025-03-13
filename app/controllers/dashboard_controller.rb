class DashboardController < ApplicationController
  def index
    @post = Post.live.page(params[:page]).per(2)
    render 'dashboard'
  end
end