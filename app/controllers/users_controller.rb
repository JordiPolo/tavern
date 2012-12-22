class UsersController < ApplicationController
  def show
    @posts = User.find(params[:id]).posts.page(params[:page]).per(1)
    render 'posts/_list', :locals => {posts: @posts}
  end
end
