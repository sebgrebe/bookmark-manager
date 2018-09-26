ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '/app/bookmark_web.rb')
require File.join(File.dirname(__FILE__), '..', '/spec/helper/setup_test_db.rb')
require 'sinatra/base'
require 'capybara'
require 'capybara/rspec'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) do
    setup_test_db
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

end
