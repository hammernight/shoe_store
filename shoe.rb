#!/usr/bin/env ruby
require 'rubygems'
require "bundler/setup"

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'


require 'haml'
require 'sass'
require 'yaml'
require 'user-agent'


ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "shoes.db"
)


configure do
  #set :database, "shoes.db"
  set :haml, {:format => :html5}
  set :views, "#{File.dirname(__FILE__)}/views"
  set :public_folder, "#{File.dirname(__FILE__)}/public"
end

before do
  @month_names = Date::MONTHNAMES.compact
end

class Shoe < ActiveRecord::Base

end

enable :sessions

get '/' do
  @title = 'Welcome to the Shoe Site'

  @new_shoe = Shoe.first
  haml :index
end

post '/results' do

  if params[:post][:release_month] == "Select Month"
    #take this out and add achievement
    flash[:notice] = "Please Select a Valid Month"
    redirect '/'
  else
    @title = "#{params[:post][:release_month]}"
    params[:post].inspect
  end
  @title = "#{params[:post][:release_month]}"
  @shoes = Shoe.find(:all,:conditions => { :release_month => params[:post][:release_month] })
  haml :results
end

get '/shoe/new' do
   Shoe.create(:name => 'Test Shoe', :release_month => 'January', :description => "blah blah blah", :brand => "Red Shoe" )
   flash[:notice] = "what"
   redirect '/'

end

class MonthlyRelease

  def get_release_month(month)

  end

end