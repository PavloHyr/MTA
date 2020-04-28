require_relative '../../pages/home_page'
require_relative '../../pages/products_page'

require 'pry'


When('user clicks the {string} button on Homepage') do |button|
  case button
  when 'Каталог товарів'
    page(HomePage).catalog_button.click
  else
    raise "can't find the #{button} button"
  end

end

Then('user can see the list of categories') do

  page(HomePage).wait_until_list_of_categories_exists
  expect(page(HomePage).list_of_categories.visible?).to be true
end

When('user selects the {string} category') do |category|
    page(HomePage).select_category(category).click
end

And('user selects the {string} subcategory from the category') do |subcategory|
    page(HomePage).select_subcategory(subcategory).click
end

Then('user can see the {string} page') do |name|
  page(ProductsPage).opened_products_page_present
  expect(page(ProductsPage).opened_products_page.text).to eq name.upcase
end

When('user selects the {string} sorting order filter') do |filter|
  page(ProductsPage).selected_sorting_filter(filter).click
end

Then('the items are sorted by {string} sorting order') do |filter|
  #Watir::Wait.until { page(ProductsPage).selected_sorting_filter(filter).present? }
  expect(page(ProductsPage).selected_sorting_filter(filter).class_name).to include 'active'
  #binding.pry
  expect(page(ProductsPage).compare_price(filter)).to be true
  #page(ProductsPage).compare_price(filter)
end


