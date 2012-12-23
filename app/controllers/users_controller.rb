class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @posts = Post.all_last(user).page(params[:page]).per(1)
    render 'posts/index'
  end
end
