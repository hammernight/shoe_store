require 'rubygems'
require 'taza/page'

module ShoeStore
  class ShoeResults < ::Taza::Page

    element(:shoe) { browser.divs(:class => 'shoe_result') }
    element(:brand) { |shoe| shoe.td(:class => 'shoe_brand') }
    element(:name) { |shoe| shoe.td(:class => 'shoe_brand') }
    element(:price) { |shoe| shoe.td(:class => 'shoe_brand') }
    element(:description) { |shoe| shoe.td(:class => 'shoe_brand') }
    element(:release_month) { |shoe| shoe.td(:class => 'shoe_brand') }
    element(:image) { |shoe| shoe.td(:class => 'shoe_brand') }
    element(:notification_email_input) {|shoe| shoe.input(:class => 'notification_email_input')}
    element(:notification_email_submit) {|shoe| shoe.button(:class => 'notification_email_submit')}

  end
end