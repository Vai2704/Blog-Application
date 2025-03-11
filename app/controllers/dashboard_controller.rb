class DashboardController < ApplicationController
  def index
    @post = Post.where(status: true).page(params[:page]).per(2)
    render 'dashboard'
  end
end