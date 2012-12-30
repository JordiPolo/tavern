class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @posts = user.posts.for(current_user).page(params[:page])
    render 'posts/index'
  end
end
