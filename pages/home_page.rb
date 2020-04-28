require_relative 'main_page'

class HomePage < MainPage
  def navigate_to_homepage
    browser.goto'https://mta.ua'
    browser.window.maximize
  end

  def search_field
    browser.element(css: '.searchBlockInput')
  end

  def suggested_list_1
    browser.elements(css: '.m-0.mb-2.allCompareTextFromSearch').to_a
  end

  def all_items_text_list_1(name)
    suggested_list_1.each { |item|  item if item.text == name}
  end

  def suggested_list_2
    browser.elements(css: '.mt-2.d-flex.align-items-center.searchItemBlock').to_a
  end

  def all_items_text_list_2
    suggested_list_2[0].text
    #suggested_list_1.each { |item| puts item.text}
  end


  def click_enter
    search_field.send_keys :enter
  end

  def catalog_button
    browser.element(css: '.col-lg-7.col-md-12.d-flex.align-items-center.justify-content-around.buttonSarchStyle.catalogBtnToggleBlock')
  end

  def list_of_categories
    browser.element(css: '.nav.nav-tabs.flex-column.justify-content-between.h-100.text-left.w-100')
  end

  def wait_until_list_of_categories_exists
    list_of_categories.wait_until(&:present?)
  end

  def select_category(category)
    all_cat = browser.elements(css: '.nav-link.d-flex.align-items-center').to_a
    all_cat.find {|cat| cat if cat.text == category.upcase}
  end

  def select_subcategory(subcategory)
    all_subcat = browser.elements(css: '.mt-2').to_a
    found_element = all_subcat.find {|subcat| subcat if subcat.text == subcategory}
    found_element.child
  end
end