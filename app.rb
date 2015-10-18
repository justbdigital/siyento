require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

set :database_file, File.expand_path("../config/database.yml", __FILE__)
set :root, File.dirname(__FILE__)
set :partial_template_engine, :erb

get '/' do
  @offers = Offer.where("deal_price < ? and created_at > ?", 100, (Date.today - 3).to_time)
  erb :index
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
