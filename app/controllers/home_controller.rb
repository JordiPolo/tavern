class HomeController < ApplicationController
  before_filter :ensure_signed_in
  def show
    render :text => "Hello #{current_user.first_name}"
  end
end
