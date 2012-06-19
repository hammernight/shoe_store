#app_file = File.expand_path('../../shoe.rb', __FILE__)
#require app_file
require_relative '../shoe.rb'

require 'rubygems'
require 'rspec'
require 'mocha'
require 'rack/test'
require 'sinatra'
require 'webrat'
require 'bundler/setup'
require 'capybara'
require 'capybara/rspec'
Bundler.require

ENV['TAZA_ENV'] = "isolation" if ENV['TAZA_ENV'].nil?
ENV["TAZA_ENV"] ||= 'isolation'
ENV['BROWSER'] ||= 'chrome'

def app
  Sinatra::Application
end

set :environment, :test

TAZA_ROOT=File.join(File.dirname(__FILE__), '../')

lib_path = File.expand_path("#{File.dirname(__FILE__)}../../lib/sites")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

Dir[File.join(TAZA_ROOT, "spec/support/**/*.rb")].each { |f| require f }

Webrat.configure do |config|
  config.mode = :rack
end

Capybara.app = app

RSpec.configure do |config|
  config.include Rack::Test::Methods
  #config.include Webrat::Methods
  #config.include Webrat::Matchers
  config.include Capybara::DSL
  config.mock_with :mocha
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

