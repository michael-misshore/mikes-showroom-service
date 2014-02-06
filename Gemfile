source 'http://rubygems.org'

ruby '2.0.0'

gem 'sinatra'
gem 'sinatra-formkeeper'
gem 'pony'
gem 'dotenv'

group :production do
  gem 'rack'
  gem 'newrelic_rpm'
  gem 'unicorn'
end

group :development, :test do
  gem 'pry-nav'
end

group :development do
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano3-unicorn', require: false
end