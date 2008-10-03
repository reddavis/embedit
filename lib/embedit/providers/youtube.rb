module Embedit

  class Youtube
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @format = 'video'
      @url = url
    end
    
    def html(options = {})
      options.reverse_merge!({:width=>425,:height=>350})
      @html = %{
        <object width="#{options[:width]}" height="#{options[:height]}">
          <param name="movie" value="http://www.youtube.com/v/#{video_id}"></param>
          <param name="wmode" value="transparent"></param>
          <embed src="http://www.youtube.com/v/#{video_id}" 
            type="application/x-shockwave-flash" wmode="transparent" 
            width="#{options[:width]}" height="#{options[:height]}">
          </embed>
        </object>
      }
    end
    
    def video_id
      @video_id ||= url[/v=([\w\d\-]+)/,1]
    end
    
    def title
      return @title if @title
      data = REXML::Document.new(open("http://gdata.youtube.com/feeds/videos/#{video_id}"))
      @title = REXML::XPath.first(data, "//title").text
    end
        
    def self.match(url)
      url.match(/youtube\.com\/watch\?v=(\S+)/xi)
    end
  
    def reverse_merge!(other_hash)
      replace(reverse_merge(other_hash))
    end
  
  end

end
