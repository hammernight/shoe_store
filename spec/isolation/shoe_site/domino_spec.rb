require 'spec_helper'
require 'shoe_site'

describe 'test helper' do
  before do
    visit '/'
  end
  context :index do
    #p last_response.body
    it'should find the form title' do
      #last_response.body.should include 'Pre-Order your shoes today'
      subject { Dom::Home.find_by_form_heading 'Pre-Order your shoes today' }
      puts "#{:form_heading} << should be Pre-Order your shoes today"
      #its(:age) { should == '47' }

    end
  end

=begin
context 'John Doe' do
  subject { Dom::Person.find_by_name 'John Doe' }
  its(:age) { should == '47' }end
=end




end