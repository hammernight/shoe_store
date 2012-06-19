require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'active_support/all'
require 'haml'
require 'sass'
require 'yaml'
require 'user-agent'
require 'pry'
require 'uri'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "shoes.db"
)

configure do
  set :haml, {:format => :html5}
end

before do
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

post '/remind' do
  if params[:email].nil? or params[:email].eql? 'Email Address'
    flash[:notice] = 'Please enter an email address to be reminded of our new shoes'
  else
    # TODO do something with this email address
    flash[:notice] = "Thanks!  We will notify you of our new shoes at this email: #{params[:email]}"
  end
  redirect request.referrer
end

post '/available' do
  if params[:email].nil? or params[:email].eql? 'Email Address'
    flash[:notice] = 'Please enter an email address to be notified when this shoe is available'
  else
    # TODO do something with this email address
    flash[:notice] = "Thanks!  We will notify you when this shoe is available at this email: #{params[:email]}"
  end
  redirect request.referrer
end

post '/promo' do
  if params[:promo_code].nil? or params[:promo_code].eql? ''
    flash[:notice] = 'Please enter a promotional code'
  else
    # TODO do something with this email address
    flash[:notice] = "The code: #{params[:promo_code]} is not a valid promotional code"
  end
  redirect request.referrer
end

post '/brand' do
  brand = params[:brand]
  if brand == "Select Brand" or brand.nil?
    #take this out and add achievement
    flash[:notice] = "Please Select a Brand"
    redirect '/'
  else
    redirect "/brands/#{URI.escape(brand)}"
  end
end

get '/shoes' do
  @shoes = Shoe.all
  sort_shoes!
  haml :shoes
end

get '/shoe/new' do
  flash[:notice] = "what"
  redirect '/'
end

get '/brands/:brand_name' do |brand_name|
  @brand_name = brand_name
  @shoes = Shoe.by_brand(Brand.find_by_name(brand_name))
  sort_shoes!
  haml :brand_view
end

get '/months/:month_name' do |month_name|
  @month_name = month_name.capitalize
  @title = "#@month_name's Shoes"
  @shoes = Shoe.find :all, :conditions => {:release_month => @month_name}
  sort_shoes!
  haml :month_view
end

get '/issues' do
  @issues = Issue.all
  haml :issues
end

get '/issues/new' do
  @issue = Issue.new
  haml :issue
end

post '/issue' do
  if params[:issue_title].nil? or params[:issue_description].nil?
    flash[:notice] = 'Please fill out the issue completely'
    redirect '/issue/new'
  else
    if Issue.find_by_title(params[:issue_title]).nil?
      issue = Issue.new :title => params[:issue_title], :description => params[:issue_description], :severity => params[:issue_severity]
      if issue.save
        flash[:notice] = 'Your issue was logged!'
        redirect '/issues'
      else
        flash[:notice] = 'There was a problem saving the issue'
        redirect '/issue/new'
      end
    else
      flash[:notice] = 'This issue already exists'
      haml :issue
    end
  end
end

get '/definition' do
  haml :definition
end

class Shoe < ActiveRecord::Base
  has_one :brand

  module Scopes
    def by_brand(brand)
      where(:brand_id => brand.id)
    end
  end

  def brand_name
    Brand.find(self.brand_id).name
  end

  extend Scopes
end

class Brand < ActiveRecord::Base
  has_many :shoes
end

class Issue < ActiveRecord::Base

end

helpers do
  def to_id(name)
    name.gsub(' ', '').underscore.downcase
  end
end

private

def sort_shoes!
  @shoes.sort! { |s1, s2| Date::MONTHNAMES.index(s1.release_month) <=> Date::MONTHNAMES.index(s2.release_month) }
end