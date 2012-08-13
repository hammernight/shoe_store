require 'rubygems'
require 'taza/page'

module ShoeStoreSite
  class HomePage < ::Taza::Page

    element(:page_title) { browser.title }
    element(:heading) { browser.h3(:id => 'form_heading') }
    element(:release_month) { browser.select(:id => 'release_month') }
    element(:promo_code) { browser.text_field(:id => 'promotional_code') }
    element(:search) { browser.button(:id => 'search_button') }
    element(:brand_select) { browser.select(:id => 'brand') }
    element(:search_button) { browser.button(:id => 'search_button')  }

  end
end
