module Embedit
  
  class Swf
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
      @format = "rich"
      @title = url.split('/').last
      self.html = url
    end
    
    def html(options = {})
      @html.gsub!(/height="\d+"/, %{height="#{options[:height].to_s}"}) unless options[:height].nil?
      @html.gsub!(/width="\d+"/, %{width="#{options[:width].to_s}"}) unless options[:width].nil?
      @html
    end
    
    def html=(url)
     @html = %{<embed width="400" height="300" quality="high" src="#{url}" type="application/x-shockwave-flash" allowfullscreen="true"/>}
    end
    
    def self.match(url)
      url.match(/(.+\.swf$)/)
    end
  end
  
end