source 'http://rubygems.org'

ruby '2.5.1'

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