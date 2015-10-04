require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

set :database_file, File.expand_path("../config/database.yml", __FILE__)
set :root, File.dirname(__FILE__)

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

get '/metrodeal' do
  parser = MetrodealParser.new
  @offers = []
  @offers = parser.fetch
  erb :metrodeal
end

get '/cashcashpinoy' do
  parser = Cashcashpinoy.new
  @offers = []
  @offers = parser.fetch
  erb :cashcashpinoy
end

get '/ensogo' do
  parser = EnsogoParser.new
  @offers = []
  @offers = parser.fetch
  erb :ensogo
end

get '/tcat' do
  parser = TcatParser.new
  @offers = []
  @offers = parser.fetch
  erb :tcat
end
