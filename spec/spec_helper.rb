Bundler.require :default, :test
require File.expand_path "../../config/boot.rb", __FILE__
require File.expand_path "../../app.rb", __FILE__

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

VCR.configure do |config|
  config.cassette_library_dir = File.expand_path "../fixtures/vcr_cassettes", __FILE__
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = { :record => :new_episodes }
end
