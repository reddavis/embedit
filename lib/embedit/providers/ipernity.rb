module Embedit

  class Ipernity
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @url = url
      
    end
    def self.match(url)
    end
  end

end
