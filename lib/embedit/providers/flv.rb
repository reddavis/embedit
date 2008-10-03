module Embedit
  
  class Flv
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
      @format = "video"
      self.html = url
    end
    
    def html(options = {})
      @html.gsub!(/height="\d+"/, %{height="#{options[:height].to_s}"}) unless options[:height].nil?
      @html.gsub!(/width="\d+"/, %{width="#{options[:width].to_s}"}) unless options[:width].nil?
      @html
    end
    
    def html=(url)
      @html = %{<embed src="http://s3.amazonaws.com/panda-test/player.swf" width="400" height="300" 
      allowfullscreen="true" allowscriptaccess="always" 
      flashvars="&displayheight=300&file=#{url}&width=400&height=300" />}
    end
    
    def self.match(url)
      url.match(/(.+\.flv$)/)
    end
  end
  
end