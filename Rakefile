require 'rubygems'
require 'bundler/setup'
#require 'taza/tasks'
require 'active_record'

require File.expand_path('../shoe_store.rb', __FILE__)
require 'sinatra/activerecord/rake'

#namespace :db do
#  desc 'Load the seed data from db/seeds.rb'
#  task :seed do
#
#    ActiveRecord::Base.establish_connection(
#        :adapter => "sqlite3",
#        :database => "shoes.db"
#    )
#
#    seed_file = File.join(File.dirname(__FILE__), 'db', 'seed.rb')
#    system("racksh < #{seed_file}")
#  end
#end
#
#Taza::Rake::Tasks.new do |t|
#  file_hole = FileUtils.mkdir_p "artifacts/#{Time.now.to_i}"
#  t.spec_opts = ["--require taza",
#                 "--format html --out #{file_hole}/index.html",
#                 "--format p",
#                 "--format FailingExamplesFormatter --out #{file_hole}/failing_examples.txt"]
#end