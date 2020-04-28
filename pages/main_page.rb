require_relative 'cached_browser'

def page(page_name)
  page_name.new
end

class MainPage
  def browser
    CachedBrowser.instance
  end
end