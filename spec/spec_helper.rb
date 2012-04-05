app_file = File.expand_path('../../shoe.rb', __FILE__)
require app_file

ENV['TAZA_ENV'] = "isolation" if ENV['TAZA_ENV'].nil?
require 'rubygems'
require 'rspec'
require 'mocha'
require 'rack/test'
require 'sinatra'

set :environment, :test

TAZA_ROOT=File.join(File.dirname(__FILE__), '../')

lib_path = File.expand_path("#{File.dirname(__FILE__)}../../lib/sites")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

Dir[File.join(TAZA_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.mock_with :mocha
end

def app
  Sinatra::Application
end