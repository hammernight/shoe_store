require 'spec_helper'
require 'shoe_store_site'

describe "Home Page should launch" do
  context "actual page items" do
    let(:shoe_store) { ShoeStoreSite.new }

    before(:each) do
      shoe_store.home_page
    end

    after(:each) do
      shoe_store.close
    end

    it "should have the right page title when loaded in the browser" do
      shoe_store.browser.title.should == "Shoe Store: Welcome to the Shoe Store"
    end
  end

end
