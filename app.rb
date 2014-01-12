#!/usr/bin/env ruby
require 'sinatra'

configure :production do
  require 'newrelic_rpm'

  set :static_cache_control, [:public, :max_age => 60 * 60 * 24 * 7]
end


get '/' do
  erb :index
end

get '/services' do
  erb :services
end

get '/packages' do
  erb :packages
end