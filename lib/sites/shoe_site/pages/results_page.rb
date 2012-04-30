require 'rubygems'
require 'taza/page'

module ShoeSite
  class ResultsPage < Taza::Page

    element(:results_list) { browser.ul(:id => 'shoe_list') }
    element(:results_item) { |item_id| results_list.li(:id => item_id) }


  end
end