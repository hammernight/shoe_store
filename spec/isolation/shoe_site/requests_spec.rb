require 'spec_helper'
require 'shoe_store'

describe "page requests" do
  before(:each) do
    get "/"
  end


  context "shoe store responses" do
    it "should load the home page" do
      last_response.should be_ok
    end

    it "should have the right title" do
      last_response.body.should include("<title>Shoe Store: Welcome to the Shoe Store</title>")
    end
  end
end
