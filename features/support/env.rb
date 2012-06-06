app_file = File.expand_path('../../../shoe.rb', __FILE__)
require app_file
Sinatra::Application.app_file = app_file

$LOAD_PATH << File.expand_path('../../../lib/sites', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'taza'
require 'watir-webdriver'
require 'watir-webdriver/wait'
require 'active_record'
require 'shoe_site'
require 'rspec/expectations'
require 'rack/test'
require 'webrat'
require 'pry'

ENV["TAZA_ENV"] ||= 'isolation'
ENV['BROWSER'] ||= 'chrome'


Webrat.configure do |config|
  config.mode = :rack
end

class Shoe < Sinatra::Base
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end


World { Shoe.new }