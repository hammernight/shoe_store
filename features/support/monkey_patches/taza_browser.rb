### pay no attention to this nothing to see here at all
module Taza
  class Browser
    def self.create_watir_webdriver(params)
      require 'watir-webdriver'
      browser = nil
      if ENV['BROWSER'] == 'chrome'
        browser = Watir::Browser.new params[:browser], :switches =>[params[:switches]], :profile => params[:profile]
      elsif ENV['BROWSER'] == 'ie'
        browser = Watir::Browser.new params[:browser]
        browser.driver.manage.timeouts.implicit_wait = 5
      else
        browser = Watir::Browser.new params[:browser]
      end
      browser
    end

  end
end
