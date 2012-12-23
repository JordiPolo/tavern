module AuthenticationMacros
  def login
    auth = mock(Authentication)
    Authentication.stub(:new).and_return(auth)
    Authentication.stub(:create_new_auth_headers).and_return("")
    auth.stub(:requested?).and_return(true)
    auth.stub(:authenticated?).and_return(true)
    user = create(:user)
    user.save
    auth.stub!(:user).and_return(user)
    post '/session'
  end
end
