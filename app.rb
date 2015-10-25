require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require "sinatra/config_file"
require "pry"

set :database_file, File.expand_path("../config/database.yml", __FILE__)
set :root, File.dirname(__FILE__)
set :partial_template_engine, :erb

config_file File.expand_path "../config/secrets.yml", __FILE__

get '/' do
  @offers = Offer.last_days.where("deal_price <= ?", 100)
  erb :index
end

post '/filter' do
  @offers = Offer.last_days.where("deal_price <= ?", params[:deal_price])
  partial :offers
end

post '/add_email' do
  if params[:email] =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    result = Mailchimp.new(settings.mailchimp_key, settings.mailchimp_list_name).add_subscriber params[:email]
    return "You have beed subscribed!" if result
    "Sorry something goes wrong plz try later"
  else
    "Its not looks like email :("
  end
end

get '/promote' do
  erb :promote
end

get '/metrodeal' do
  @offers = Offer.where datasource: "metrodeal"
  erb :metrodeal
end

get '/cashcashpinoy' do
  @offers = Offer.where datasource: "cashcashpinoy"
  erb :cashcashpinoy
end

get '/ensogo' do
  @offers = Offer.where datasource: "ensogo"
  erb :ensogo
end

get '/tcat' do
  @offers = Offer.where datasource: "tcat"
  erb :tcat
end

get '/trendsndeals' do
  @offers = Offer.where datasource: "trendsndeals"
  erb :trendsndeals
end

get '/dealgrocer' do
  @offers = Offer.where datasource: "dealgrocer"
  erb :dealgrocer
end

get '/pinoygreatdeals' do
  @offers = Offer.where datasource: "pinoygreatdeals"
  erb :pinoygreatdeals
end

get '/dealspot' do
  @offers = Offer.where datasource: "dealspot"
  erb :dealspot
end
