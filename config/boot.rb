require "sinatra/activerecord"
Dir[File.expand_path '../../app/services/*.rb', __FILE__].each { |f| require f }
Dir[File.expand_path '../../app/models/*.rb', __FILE__].each { |f| require f }
