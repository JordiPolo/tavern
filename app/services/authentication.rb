class Authentication

  def self.create_new_auth_headers(url)
    Rack::OpenID.build_header(
      :identifier => "https://www.google.com/accounts/o8/id",
      :required => ["http://axschema.org/contact/email",
                    "http://axschema.org/namePerson/first",
                    "http://axschema.org/namePerson/last"],
                    :return_to => url,
                    :method => 'POST')
  end

  def initialize(request)
    @request = request
  end
  
  def requested?
    @request.env[Rack::OpenID::RESPONSE]
  end

  def authenticated?
    user.present?
  end

  def user
    @user ||= user_from_openid
  end

  private
  def user_from_openid
     openid = @request.env[Rack::OpenID::RESPONSE]
      case openid.status
      when :success
        ax = OpenID::AX::FetchResponse.from_success_response(openid)
        user = User.where(:identifier_url => openid.display_identifier).first
        user ||= User.create!(:identifier_url => openid.display_identifier,
                              :email => ax.get_single('http://axschema.org/contact/email'),
                              :first_name => ax.get_single('http://axschema.org/namePerson/first'),
                              :last_name => ax.get_single('http://axschema.org/namePerson/last'))
      when :failure
        nil
      end
  end

end
