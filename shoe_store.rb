require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'active_support/all'
require 'haml'
require 'sass'
require 'yaml'
require 'user-agent'
require 'pry'
require 'uri'
require_relative 'models/achievement'
require_relative 'models/request'
require_relative 'models/brand'
require_relative 'models/issue'
require_relative 'models/promo_code'
require_relative 'models/shoe'

require 'pry'
require 'json'

class ShoeStore < Sinatra::Application

  configure do
    set :haml, {:format => :html5}
    set :protection, :except => [:json_csrf]
    enable :sessions

    set :database_file, './config/database.yml'
  end

end

before do
  unless request.path_info.match /^\/(admin|stylesheet\.css)/

    previous = Request.order(:created_at).last
    @request_model = Request.create! :data => request.to_yaml, :ip_address => (request.env["HTTP_X_REAL_IP"] || request.ip)

    if previous && previous.ip_address != (request.env["HTTP_X_REAL_IP"] || request.ip)
      achieve! MultipleIpAddresses
    end

    Achievement.user_agent_achievements(UserAgent::ParsedUserAgent.new(request.user_agent || ""), @request_model)
  end
  @month_names = Date::MONTHNAMES.compact
end

get '/' do
  @title = 'Welcome to the Shoe Store'
  @brand_names = Brand.all
  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

helpers do
  def to_id(name)
    name.gsub(' ', '').underscore.downcase
  end
end

private

def achieve!(key)
  Achievement.achieve! key, @request_model
end

def sort_shoes!
  @shoes.to_a.sort! { |s1, s2| Date::MONTHNAMES.index(s1.release_month) <=> Date::MONTHNAMES.index(s2.release_month) }
end