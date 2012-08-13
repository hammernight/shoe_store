require 'rubygems'
require 'taza'

module ShoeStoreSite
  class Partials < Taza::Page

    element(:alerts){ browser.div(:class => 'flash notice')}
  end
end