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

class ShoeStore < Sinatra::Application

	configure do
		set :haml, {:format => :html5}
		enable :sessions
	end

	configure :development, :test do
		ActiveRecord::Base.establish_connection(
				:adapter => 'sqlite3',
				:database => 'shoes.db'
		)
	end

	configure :production do
		p "configuring database: #{ENV['DATABASE_URL']}"
		db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/shoe_store')

		ActiveRecord::Base.establish_connection(
				:adapter => 'postgresql',
				:host => db.host,
				:username => db.user,
				:password => db.password,
				:database => db.path[1..-1],
				:encoding => 'utf8'
		)
	end
end

before do
	unless request.path_info.match /^\/(admin|stylesheet\.css)/

		previous = Request.last(:order => :created_at)
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
	@shoes.sort! { |s1, s2| Date::MONTHNAMES.index(s1.release_month) <=> Date::MONTHNAMES.index(s2.release_month) }
end