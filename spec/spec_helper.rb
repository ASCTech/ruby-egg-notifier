require 'rubygems'
require 'bundler/setup'
require 'fake_web'

require 'egg-notifier'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'

  FakeWeb.allow_net_connect = false

#  FakeWeb.register_uri(:post, 'http://egg.example.com/events', :status => 201)

  config.before(:each) { Egg.instance_variable_set('@url', nil); Egg.service = nil }
end
