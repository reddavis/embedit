module Embedit

  class YouTube
  
    attr_accessor :title, :url, :format, :html
  
    def initialize(url)
      @input_url = url
      get_info
    end
    
    def html(size = {})
      
    end
    
    def html=(video_id)
      @html = %{
        <object width="425" height="350">
          <param name="movie" value="http://www.youtube.com/v/#{video_id}"></param>
          <param name="wmode" value="transparent"></param>
          <embed src="http://www.youtube.com/v/#{video_id}" 
            type="application/x-shockwave-flash" wmode="transparent" 
            width="425" height="350">
          </embed>
        </object>
      }
    end
    
    private
    
    def get_info
      video_id = extract_id(@input_url)
      data = REXML::Document.new(open("http://gdata.youtube.com/feeds/videos/#{video_id}"))
      @title = REXML::XPath.first(data, "//title").text
      puts @html = video_id
    end
    
    def extract_id(url)
      url.scan(/v=([\w\d]+)/)
    end
  
  end

end
