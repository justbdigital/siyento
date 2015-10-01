require "sinatra/activerecord"
Bundler.require :default
require File.expand_path('../../app/services/parser_base.rb', __FILE__)
Dir[File.expand_path '../../app/services/*.rb', __FILE__].each { |f| require f }
Dir[File.expand_path '../../app/models/*.rb', __FILE__].each { |f| require f }
