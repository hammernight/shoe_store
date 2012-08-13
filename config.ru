require './shoe_store.rb'

Dir["./routes/*.rb"].each {|file| require file }
Dir["./models/*.rb"].each {|file| require file }
Dir["./helpers/*.rb"].each {|file| require file }

run ShoeStore