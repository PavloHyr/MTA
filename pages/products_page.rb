require_relative 'main_page'

class ProductsPage < MainPage

  def opened_products_page
    browser.element(css: '.pl-3.mb-3.headingStyleInAllContetn.text-uppercase')
  end

  def opened_products_page_present
    opened_products_page.wait_until(&:present?)
  end

  def sorting_order_filters
    browser.elements(css: '.mr-3.text-uppercase.mainSortByBtnCatalog').to_a
  end

  def selected_sorting_filter(filter)
    sorting_order_filters.find {|item| item if item.text == filter.upcase}
  end

  def items_prices
    browser.elements(css: '.newPriseValuePopup').to_a
  end

  def compare_price(filter)
    without_nil_prices = items_prices.reject{|item| item.text.to_i == 0 || nil}
    case filter
    when 'Спочатку дорогі'
      without_nil_prices.each_cons(2).all?{|left, right| left.text.to_i >= right.text.to_i}
    when 'Спочатку дешеві'
      #without_nil_prices = items_prices.reject{|item| item.text.to_i == 0 || nil}
      without_nil_prices.each_cons(2).all?{|left, right| left.text.to_i <= right.text.to_i}
    end
  end

  def element_active?


  end

end