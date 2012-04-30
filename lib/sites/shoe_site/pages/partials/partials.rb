require 'rubygems'
require 'taza'

module ShoeSite
  class Partials < Taza::Page

    element(:alerts){ browser.div(:class => 'flash notice')}
  end
end