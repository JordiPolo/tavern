require 'rack/openid'
Tavern::Application.config.middleware.use 'Rack::OpenID'
