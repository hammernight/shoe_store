require 'rubygems'
require 'taza'

module ShoeSite
  include ForwardInitialization

  class ShoeSite < ::Taza::Site

    def close
      browser.close
    end

  end
end
