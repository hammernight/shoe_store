require 'spec_helper'
require 'shoe_site'

describe "page requests" do
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
end
