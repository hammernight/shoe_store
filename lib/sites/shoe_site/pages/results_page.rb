require 'rubygems'
require 'taza/page'

module ShoeSite
  class ResultsPage < Taza::Page

    element(:title){ browser.title}
    element(:heading){browser.h2()}
    element(:results_list) { browser.ul(:id => 'shoe_list') }
    element(:results_list_items) { results_list.lis }
    element(:results_item) { |item_id| results_list.li(:id => item_id) }


  end
end