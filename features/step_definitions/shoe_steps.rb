Given /^A shoe with brand "([^"]*)"$/ do |brand|
  ShoeFactory.create :brand => brand
end

Given /^(\d+) shoes$/ do |number_of_shoes|
  pending
end

Given /^A shoe for month: (.*)$/ do |month|
  pending
end

When /^I search for brand "([^"]*)"$/ do |brand|
  pending
end

When /^I view all shoes$/ do
  pending
end

Then /^I should see (\d+) shoe$/ do |number_of_shoes|
  pending
end

Then /^I should see (\d+) shoes$/ do |number_of_shoes|
  pending
end

Then /^I should see (\d+) shoe for month: (.*)$/ do |number_of_shoes, month|
  pending
end