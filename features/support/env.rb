app_file = File.expand_path('../../../shoe_store.rb', __FILE__)
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
require 'shoe_store_site'
require 'rspec/expectations'
require 'rack/test'
require 'webrat'
require 'pry'
require 'rake'

ENV["TAZA_ENV"] ||= 'isolation'
ENV['BROWSER'] ||= 'firefox'

Webrat.configure do |config|
  config.mode = :sinatra
end

World do
  Webrat::SinatraSession.new
end