When /^I visit shoe site$/ do
  #need to do something here later :/
  @site.browser.title
end

Then /^the title should say "([^"]*)"$/ do |title|
  @site.home_page.page_title.should == title
end

When /^I pick my preorder month "([^"]*)"$/ do |month|
  @site.home_page.release_month.select month
  @site.home_page.search.click
end

Then /^I should be able to see a list of shoes being released that month$/ do
  @site.results_page.results_list.should exist
end

When /^I perform the search without selecting a month$/ do
  @site.home_page.search.click
end

Then /^I should see a warning message "([^"]*)"$/ do |message|
  @site.partials.alerts.should exist
  @site.partials.alerts.text.should == message
end

Then /^I should be on the home page$/ do
  @site.browser.url.should == 'http://localhost:9393/'
end

Then /^I should see (\d+) shoes are being released in "([^"]*)"$/ do |number, month_name|
  @site.results_page.results_list_items.count.should == number.to_i
  @site.results_page.heading.text.should include(month_name)
end

Then /^I should (not )?the "([^"]*)" in the title$/ do |toggle, month_name|
  if toggle == "not "
    @site.results_page.title.should_not include(month_name)
  else
    @site.results_page.title.should include(month_name)
  end

end