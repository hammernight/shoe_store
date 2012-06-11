app_file = File.expand_path('../../shoe.rb', __FILE__)
require app_file

ENV['TAZA_ENV'] = "isolation" if ENV['TAZA_ENV'].nil?
require 'rubygems'
require 'rspec'
require 'mocha'
require 'rack/test'
require 'sinatra'
require 'webrat'
require 'bundler/setup'
Bundler.require
require 'capybara/rspec'


set :environment, :test

TAZA_ROOT=File.join(File.dirname(__FILE__), '../')

lib_path = File.expand_path("#{File.dirname(__FILE__)}../../lib/sites")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

Dir[File.join(TAZA_ROOT, "spec/support/**/*.rb")].each { |f| require f }

Webrat.configure do |config|
  config.mode = :rack
end

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Webrat::Methods
  config.include Webrat::Matchers
  config.mock_with :mocha
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

def app
  Sinatra::Application
end