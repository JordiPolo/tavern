class HomeController < ApplicationController
  before_filter :ensure_signed_in
  def show
    @posts = Post.page(params[:page]).per(1)
    render :template => "posts/index"
  end
end
