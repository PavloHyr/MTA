
require_relative '../../pages/home_page'

require 'pry'

Given('user visits MTA store') do
  page(HomePage).navigate_to_homepage
end

When('user enters {string} text in Search field on Homepage') do |name|
  page(HomePage).search_field.send_keys(name)
end

When('user hit Enter button in Search field on Homepage') do
  page(HomePage).click_enter
end

Then('user can see the {string} text in suggested list1') do |name|

   all_items = page(HomePage).suggested_list_1
   binding.pry
  all_items.each do |item|

    #item.text.include? name
    p item.text
      expect(item.text).to include "gdfg"
  end
end

Then('user can see the {string} text in suggested list2') do |name|
  expect(page(HomePage).all_items_text_list_2).to include name.capitalize
end

Then('user can see the {string} text in Search results page') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end
