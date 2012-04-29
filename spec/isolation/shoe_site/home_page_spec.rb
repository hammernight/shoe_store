require 'spec_helper'
require 'shoe_site'

describe "Home Page should launch" do


  context "shoe site responses" do
    it "should load the home page" do
      get '/'
      last_response.should be_ok
    end

    it "should have the right title" do
      get '/'
      last_response.body.should include("<title>Shoe Site:  Welcome to the Shoe Site</title>")
    end

  end

  context "form functionality" do
    before(:each) do
      get "/"
    end

    xit "should let me submit a month" do

    end
    it "should have a form you can post" do
      last_response.body.should have_selector("form", :method => 'post')
    end

    it "should have a select list with the months of the year" do
      options = []
      html = last_response.body

      p options << html.split("<option")

          #do |item|
      #  options << item
      #end
      options.size.should == 12
    end

    it "should submit the form" do
      click_button "Search"
      visit response.location if response.location
    end

    it "should show the month name on the results page" do
      select "January"
      click_button "Search"
      visit response.location if response.location
      last_response.body.should have_selector("h2")
      last_response.body.should include("<h2>New Releases for January</h2>")
    end

    it "should not show the 0 on the results page" do

      click_button "Search"
      visit response.location if response.location
      last_response.body.should have_selector("h2")
      last_response.body.should_not include("<h2>New Releases for 0</h2>")
    end

  end
end
