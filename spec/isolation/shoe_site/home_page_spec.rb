require 'spec_helper'
require 'shoe_site'

describe "Home Page should launch" do


  context "shoe site responses" do
    it "should load the home page" do
      get '/'
      last_response.should be_ok
    end

  end

  context "actual page items" do
    let(:shoe_site) { ShoeSite.new }
    before(:each) do
      shoe_site.home_page
    end

    after(:each) do
      shoe_site.close
    end

    it "should have the right page title when loaded in the browser" do
      shoe_site.browser.title.should == "Welcome to the Shoe Site"
      sleep 4
    end
  end

end
