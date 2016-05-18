require 'spec_helper'


describe 'page requests' do
  before(:each) do
    get '/'
  end

  it { expect(last_response).to be_ok }

  context 'shoe store responses' do
    it 'should have the right title' do
      expect(last_response.body).to include('<title>Shoe Store: Welcome to the Shoe Store</title>')
    end
  end
end
