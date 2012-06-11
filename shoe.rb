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


configure do
  #set :database, "shoes.db"
  set :haml, {:format => :html5}
  set :views, "#{File.dirname(__FILE__)}/views"
  set :public_folder, "#{File.dirname(__FILE__)}/public"
end

before do
  ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => "shoes.db"
  )

  @month_names = Date::MONTHNAMES.compact
  @brand_names = Brand.all
end

enable :sessions

get '/' do
  @title = 'Welcome to the Shoe Site'
  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
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
  @shoes = Shoe.find(:all, :conditions => {:release_month => params[:post][:release_month]})
  haml :results
end

get '/shoe/new' do
  Shoe.create(:name => 'Test Shoe', :release_month => 'January', :description => "blah blah blah", :brand => "Red Shoe")
  flash[:notice] = "what"
  redirect '/'

end

get '/:month_name' do |month_name|
  @month_name = month_name.capitalize
  @title = "#@month_name's Shoes"
  haml :'month_view'
end




#models
class Shoe < ActiveRecord::Base
end

class Brand < ActiveRecord::Base
end
