require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
set :database_file, File.expand_path("../config/database.yml", __FILE__)


get '/' do
  parser = SuredealParser.new
  parser.fetch
  @gdeals = parser.gdeals
  @tdeals = parser.tdeals
  @mdeals = parser.mdeals

  erb :index
end

get '/promote' do
	erb :promote
end
