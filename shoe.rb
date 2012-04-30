#!/usr/bin/env ruby
require 'rubygems'
require "bundler/setup"

require 'active_record'

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'


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

enable :sessions

get '/' do
  @title = 'Welcome to the Shoe Site'
  @month_names = Date::MONTHNAMES.compact
  haml :index
end

post '/results' do
  @shoes = {}
  if params[:post][:release_month] == "Select Month"
    #take this out and add achievement
    flash[:notice] = "Please Select a Valid Month"
    redirect '/'
  elsif params[:post][:release_month] == "July"
    @shoes = {:one => "first item", :two => "second item", :three => "third item"}
  else
    @title = "#{params[:post][:release_month]}"
    params[:post].inspect
  end
  @title = "#{params[:post][:release_month]}"
  haml :results
end

class MonthlyRelease

   def get_release_month(month)

   end

end