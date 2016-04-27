require 'spec_helper'

describe ShoeStore, :type => :request do
  context 'form functionality' do
    context 'basic requests' do
      before(:all) do
        get '/'
      end

        it { expect(last_response).to be_ok }

    end
  end
end

describe 'Shoe Store' do
  context 'form submission and results' do
    before(:each) do

    end

    it 'has the remind me form' do
      visit '/'
      expect(page).to have_selector(:css, 'form#remind_email_form')
    end

    it 'has the promo code form' do
      visit '/'
      expect(page).to have_selector(:css, 'form#promo_code_form')
    end

    it 'should have a select list with the brands' do
      visit '/'
      expect(page).to have_selector 'select[name="brand"]'
    end

    it 'should submit the form' do
      visit 'http://127.0.0.1:9393'
      click_button 'Search'
      expect(find('div#flash div.flash.notice').text).to eql 'Please Select a Brand'
    end

    it "should show the brand name on the results page" do
      select "Nine West"
      click_button "Search"
      page.body.should include('<div class="title">')
      page.body.should include("<h2>Nine West's Shoes</h2>")
    end

    it "should show the shoe name" do
      select "Gucci"
      click_button "Search"
      page.body.should include('<a href="/brands/Gucci">')
    end

    it "should show the shoe release month" do
      select "Nine West"
      click_button "Search"
      page.body.should include("January")
    end

    it "should show the shoe description" do
      select "Gucci"
      click_button "Search"
      page.body.should include('<td class="shoe_result_label">Description</td>')
      page.body.should include("Brilliant crystals adorn a satin pump with a partially concealed platform and flirty peep toe.")
    end


    it "should not show the 0 on the results page" do
      click_button "Search"
      page.body.should have_selector("h2")
      page.body.should_not include("<h2>New Releases for 0</h2>")
    end

    it "should show me an empty list for shoes in December" do
      click_link "December"
      page.body.should include("<h2>December's Shoes</h2>")
    end

    it "should show the flash message when no brand is selected" do
      click_button "Search"
      page.body.should include('<div class="flash notice">Please Select a Brand</div>')
    end



    context "navigation links" do
      it "should land on month page when month header link is clicked" do
        click_link "January"
        page.body.should include("<title>Shoe Store: January's Shoes</title>")
      end
    end
  end
end
