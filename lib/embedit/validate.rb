module Embedit
  class Validate
  
    def initialize(url)
      @url = url
      @valid = accessible? # && add more tests here if needed
    end
  
    def valid?
      @valid
    end
    
    private
  
    def accessible?
      true if @url.match(/(flv|jpg|png|gif|mp3)$/) || open(@url)    #Header codes are annoying, just check that the page works, the check with Embed::Media will narrow down more
    rescue 
      false
    end
  
  end
end
