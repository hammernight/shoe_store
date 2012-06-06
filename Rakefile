#Generated at 2012-04-04 16:08:17 -0400

require 'rubygems'
require 'bundler/setup'
require 'taza/tasks'
require File.expand_path('../shoe.rb', __FILE__)
require 'sinatra/activerecord/rake'
require 'active_record'


Taza::Rake::Tasks.new do |t|
  file_hole = FileUtils.mkdir_p "artifacts/#{Time.now.to_i}"
  t.spec_opts = ["--require taza",
                 "--format html --out #{file_hole}/index.html",
                 "--format p",
                 "--format FailingExamplesFormatter --out #{file_hole}/failing_examples.txt"]
end

namespace :db do
  task :environment do
    require 'active_record'
    ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :dbfile => 'sqlite://shoes.db'
  end

  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end

