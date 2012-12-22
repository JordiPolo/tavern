class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :ensure_signed_in

  def new
    response.headers['WWW-Authenticate'] = Authentication.create_new_auth_headers(session_url)
    head 401
  end

  def create
    auth = Authentication.new(request)
    if auth.requested?
      if auth.authenticated?
        session[:user_id] = auth.user.id
        redirect_to(session[:redirect_to] || root_path)
      else
        render :action => 'problem'
      end
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end

end
