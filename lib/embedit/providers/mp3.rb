module Embedit
  
  class Mp3
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
      @format = "audio"
      @title = url.split('/').last
      self.html = url
    end
    
    def html(options = {})
      @html.gsub!(/height="\d+"/, %{height="#{options[:height].to_s}"}) unless options[:height].nil?
      @html.gsub!(/width="\d+"/, %{width="#{options[:width].to_s}"}) unless options[:width].nil?
      @html
    end
    
    def html=(url)
      @html = %{<embed src="http://s3.amazonaws.com/panda-test/player.swf" width="400" height="20" allowfullscreen="true" allowscriptaccess="always" flashvars="&displayheight=20&file=#{url}&width=400&height=20" />}
    end
    
    def self.match(url)
      url.match(/(.+\.mp3$)/)
    end
  end
  
end