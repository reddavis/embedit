module Embedit

  class YouTube
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @format = 'video'
      @url = url
      get_info
    end
    
    def html(size = {})
      @html.gsub!(/height="\d+"/, %{height="#{size[:height].to_s}"}) unless size[:height].nil?
      @html.gsub!(/width="\d+"/, %{width="#{size[:width].to_s}"}) unless size[:width].nil?
      @html
    end
    
    def html=(video_id)
      #Add &ap=%2526fmt%3D18 to end of YouTube embed url to gain access to higher quality videos
      @html = %{
        <object width="425" height="350">
          <param name="movie" value="http://www.youtube.com/v/#{video_id}"></param>
          <param name="wmode" value="transparent"></param>
          <embed src="http://www.youtube.com/v/#{video_id}&ap=%2526fmt%3D18" 
            type="application/x-shockwave-flash" wmode="transparent" 
            width="425" height="350">
          </embed>
        </object>
      }
    end
        
    private
    
    def get_info
      video_id = extract_id(@url)
      data = REXML::Document.new(open("http://gdata.youtube.com/feeds/videos/#{video_id}"))
      @title = REXML::XPath.first(data, "//title").text
      self.html = video_id
    end
    
    def extract_id(url)
      url.scan(/v=([\w\d]+)/)
    end
  
  end

end
