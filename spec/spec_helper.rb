require_relative '../shoe_store.rb'
require_relative '../models/promo_code.rb'
require_relative '../models/email_notification'
require_relative '../models/request'
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

ENV['TAZA_ENV'] ||= 'isolation'
ENV['BROWSER'] ||= 'firefox'

def app
  Sinatra::Application
end

set :environment, :test

TAZA_ROOT=File.join(File.dirname(__FILE__), '../')

lib_path = File.expand_path("#{File.dirname(__FILE__)}../../lib/sites")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

Dir[File.join(TAZA_ROOT, 'spec/support/**/*.rb')].each { |f| require f }

Webrat.configure do |config|
  config.mode = :rack
  config.open_error_files = false
end

Capybara.app = Sinatra::Application.new

RSpec.configure do |config|
  include Webrat::Methods
  include Webrat::Matchers
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  config.mock_with :mocha
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end

