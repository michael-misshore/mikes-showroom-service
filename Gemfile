source 'http://rubygems.org'

ruby '2.4.3'

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
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-unicorn', require: false
end