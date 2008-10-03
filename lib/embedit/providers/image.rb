module Embedit
  
  class Image
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
    end
    
    def html(options = {})
      attributes = options.collect {|k,v| "#{k}=\"#{v}\" "}.join(" ")
      %{
        <a href="#{@url}"><img src="#{@url}" #{attributes}/></a>
      } 
    end
    
    def self.match(url)
      url.match(/(.+\.(gif|jpg|png)$)/)
    end
  end
  
end