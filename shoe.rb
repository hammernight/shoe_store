#!/usr/bin/env ruby
require 'rubygems'
require "bundler/setup"

require 'active_record'

require 'sinatra'
require 'sinatra/activerecord'

require 'haml'
require 'sass'
require 'yaml'
require 'user-agent'

  set :haml, {:format => :html5}
#  set :database, ENV['DATABASE_URL'] ? ENV['DATABASE_URL'] : 'sqlite://shoes.db'

  configure do
    set :views, "#{File.dirname(__FILE__)}/views"
    set :public_folder, "#{File.dirname(__FILE__)}/public"
  end

  get '/' do
    @title = 'Welcome to the Shoe Site'
    haml :index
  end
