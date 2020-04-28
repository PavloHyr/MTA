require 'Watir'
require 'webdrivers'

class CachedBrowser
  def self.instance
    @@browser ||= Watir::Browser.new
  end
end