#!/usr/bin/env ruby
require 'rubygems'
require "bundler/setup"

require 'active_record'

require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'

require 'haml'
require 'sass'
require 'yaml'
require 'user-agent'

set :haml, {:format => :html5}
set :database, ENV['DATABASE_URL'] ? ENV['DATABASE_URL'] : 'sqlite://shoes.db'


#Models
class Issue < ActiveRecord::Base
end

class Request < ActiveRecord::Base
end

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  set :public_folder, "#{File.dirname(__FILE__)}/public"
end

set :sessions, :true
use Rack::Flash

get '/' do
  @title = 'Welcome to the Shoe Site'
  @month_names = Date::MONTHNAMES.compact
  haml :index
end

post '/' do
  if params[:post][:release_month] == "Select Month"
    #take this out and add achievement
    @message = "Please Select a Valid Month"
  else
  @title = "#{params[:post][:release_month]}"
  params[:post].inspect
  end
  haml :results
end