#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/formkeeper'
require 'dotenv'
require 'pony'

Dotenv.load

configure :development, :test do
  require 'pry'

  # Config for [MailCatcher](http://mailcatcher.me/)
  set :email_options, {
    via: :smtp,
    via_options: {
      address: "localhost",
      port: 1025
    }
  }
end

configure :production do
  require 'newrelic_rpm'

  set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 7]
  set :email_options, {
    via: :smtp,
    via_options: {
      address: 'smtp.sendgrid.net',
      port: '587',
      domain: 'mikesshowroomservice.com',
      user_name: ENV['SENDGRID_USERNAME'],
      password: ENV['SENDGRID_PASSWORD'],
      authentication: :plain,
      enable_starttls_auto: true
    }
  }
end

Pony.options = settings.email_options

get '/' do
  erb :index
end

get '/services' do
  erb :services
end

get '/packages' do
  erb :packages
end

get '/contact' do
  erb :contact
end

post '/contact' do
  form do
    filters :strip
    field :subject, present: true
    field :email,   present: true, email: true
  end

  if form.failed?
    erb :contact
  else
    Pony.mail to: 'mmisshore@gmail.com',
              from: params[:email],
              subject: params[:subject],
              body: params[:message]

    erb :contact_confirmation
  end
end