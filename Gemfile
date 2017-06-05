source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# For running on Heroku
gem 'rails_12factor', group: :production
gem 'raygun4ruby'

gem 'devise'
gem 'devise_invitable'
gem 'authority'
gem 'rolify'

gem 'pry-rails'
gem 'pry-stack_explorer'
gem 'pry-byebug'

gem 'slim-rails'
gem 'simple_form'
gem 'countries'
gem 'country_select'
gem 'breadcrumbs_on_rails'
gem 'inline_svg'

gem 'analytics-ruby', '~> 2.0.0', require: 'segment/analytics'

# For event location URL validation
gem 'valid_url', '~> 0.0.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks', require: false
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'dotenv-rails'
  gem 'rubocop', require: false
  gem 'parity', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'

  # Windows specific
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
  gem 'bcrypt', '3.1.11', platforms: [:mingw, :mswin, :x64_mingw], :require => 'bcrypt'

end
