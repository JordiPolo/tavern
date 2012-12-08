source 'https://rubygems.org'

gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem 'activerecord-deprecated_finders',     :git => 'git://github.com/rails/activerecord-deprecated_finders.git'
gem 'journey',   :git => 'git://github.com/rails/journey.git'
gem 'arel',      :git => 'git://github.com/rails/arel.git'

gem 'sqlite3'
gem 'jquery-rails'
gem 'kaminari'

#authentication
gem "ruby-openid"
gem "rack-openid"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   :git => 'git://github.com/rails/sass-rails.git'
  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'debugger'
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end
