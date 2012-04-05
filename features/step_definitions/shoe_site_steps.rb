When /^I visit shoe site$/ do
  #need to do something here later :/
 @site.browser.title
end

Then /^the title should say "([^"]*)"$/ do |title|
 @site.home_page.page_title.should == title
end

When /^I pick my preorder month "([^"]*)"$/ do |month|
  @site.home_page.release_month.select month
end

Then /^I should be able to see a list of shoes being released that month$/ do
  pending # express the regexp above with the code you wish you had
end
