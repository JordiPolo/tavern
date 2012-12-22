module AuthenticationMacros
  def login
    #Need to  mock authorization
    @controller = SessionsController.new
    post :create
  end
end
