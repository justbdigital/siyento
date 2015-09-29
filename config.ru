require './app'
require 'pry'
Dir[File.expand_path '../services/*.rb', __FILE__].each { |f| require f }
run Sinatra::Application
