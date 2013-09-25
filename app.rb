#!/usr/bin/env ruby
require 'sinatra'

configure :production do
  require 'newrelic_rpm'
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