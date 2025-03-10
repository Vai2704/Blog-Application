class DashboardController < ApplicationController
  def index
    @post = Post.all
    render 'dashboard'
  end
end