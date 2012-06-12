require 'spec_helper'
require 'shoe_site'


describe "Home Page should launch" do
  before(:each) do
    get "/"
  end

  context "shoe site responses" do
    it "should load the home page" do
      last_response.should be_ok
    end

    it "should have the right title" do
      last_response.body.should include("<title>Shoe Site: Welcome to the Shoe Site</title>")
    end

  end

  context "form functionality" do
    it "should have a form you can post" do
      last_response.body.should have_selector("form", :method => 'post')
    end

    it "should have a select list with the months of the year" do
      response.should have_selector 'select[name="post[brand]"]'
    end

    it "should submit the form" do
      click_button "Search"
      visit response.location if response.location
    end

    it "should show the month name on the results page" do
      select "Nine West"
      click_button "Search"
      visit response.location if response.location
      last_response.body.should have_selector("h2")
      last_response.body.should include("<h2>New Releases for Nine West</h2>")
    end

    it "should not show the 0 on the results page" do
      click_button "Search"
      visit response.location if response.location
      last_response.body.should have_selector("h2")
      last_response.body.should_not include("<h2>New Releases for 0</h2>")
    end

    it "should show me an empty list for shoes in july" do
      click_link "July"
      last_response.body.should include("<h1>July's Shoes</h1>")
    end

    it "should show the flash message when no month is selected" do
      click_button "Search"
      visit response.location if response.location
      last_response.body.should include("<div class='flash notice'>Please Select a Brand</div>")
    end

    context "navigation links" do
      it "should land on month page when month header link is clicked" do
        click_link "January"
        last_response.body.should include("<title>Shoe Site: January's Shoes</title>")
      end
    end

  end
end
