require 'rubygems'
require 'taza'
require 'active_record'
Dir["#{File.dirname(__FILE__)}/../../models/*.rb"].each { |f| require f }

module ShoeStoreSite
  include ForwardInitialization

  class ShoeStoreSite < ::Taza::Site

    def close
      browser.close
    end

  end
end