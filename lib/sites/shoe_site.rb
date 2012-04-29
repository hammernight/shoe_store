require 'rubygems'
require 'taza'
require 'active_record'
require 'factory_girl'
Dir["#{File.dirname(__FILE__)}/shoe_site/models/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/shoe_site/factories/*.rb"].each {|f| require f}

module ShoeSite
  include ForwardInitialization

  class ShoeSite < ::Taza::Site

    def close
      browser.close
    end

  end
end
