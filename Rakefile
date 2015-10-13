require "sinatra/activerecord/rake"
require File.expand_path "../config/boot", __FILE__

namespace :db do
  task :load_config do
    require "./app"
  end
end

namespace :parser do
  desc "Parse all content and store into database"
  task :parse_all do
    ParsersSchedule.new.fetch_all
  end
end
