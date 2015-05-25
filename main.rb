require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
require './env' if File.exists?('env.rb')

account_sid = ENV['ACCOUNT_SID']
auth_token  = ENV['AUTH_TOKEN']

Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

get "/" do
  "Hello world"
end

get '/incoming-call' do
  # send text
    content_type 'text/xml'
    "<Response><Play>#{ENV['AUDIO_URL']}</Play></Response>"
end
