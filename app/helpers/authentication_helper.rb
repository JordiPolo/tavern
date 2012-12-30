module AuthenticationHelper
  def signed_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    #This can happen when we delete an user from the DB
    if @current_user.nil?
      session[:user_id] = nil
      ensure_signed_in
    end
    @current_user
  end

  def ensure_signed_in
    unless signed_in?
      session[:redirect_to] = request.original_url
      redirect_to(new_session_path)
    end
  end
end
