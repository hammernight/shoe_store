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
require 'pry'


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

  if params[:post][:brand] == "Select Brand"
    #take this out and add achievement
    flash[:notice] = "Please Select a Brand"
    redirect '/'
  else
    @title = "#{params[:post][:brand]}"
    params[:post].inspect
  end
  @title = "#{params[:post][:brand]}"
  @brand = Brand.find_by_name(params[:post][:brand])
  @shoes = Shoe.by_brand(@brand)
  haml :results
end

get '/shoe/new' do
  #Brand.create name: 'Nine West'
  #Brand.create name: 'Manolo Blahnik'
  #Brand.create name: 'Christian Louboutin'
  #
  #Shoe.create :name => 'Violators', :description => 'Awesomeness', :brand_id => 1, :release_month => 'January', :image_path => 'shoe1.jpg'
  #Shoe.create :name => 'Terminators', :description => 'These are awesome', :brand_id => 2, :release_month => 'February', :image_path => 'shoe2.jpg'
  #Shoe.create :name => 'Shit Kickers', :description => 'Wonky awesome', :brand_id => 3, :release_month => 'January', :image_path => 'shoe3.jpg'
  #Shoe.create :name => 'Toe Holders', :description => 'Awesomer than you!', :brand_id => 3, :release_month => 'September', :image_path => 'shoe4.jpg'

  #Shoe.create(:name => 'Test Shoe', :release_month => 'January', :description => "blah blah blah", :brand => "Red Shoe")
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
  has_one :brand

  module Scopes
    def by_brand(brand)
      where(:brand_id => brand.id)
    end
  end
  extend Scopes
end

class Brand < ActiveRecord::Base
  has_many :shoes
end
