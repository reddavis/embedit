module Embedit
  
  class CollegeHumor
    
    attr_reader :title, :html, :format, :url
    
    def initialize(url)
      @url = url
    end
    
    def format
      @fomat ||= case url
        when /video/ then 'video'
        when /picture/ then 'photo'
      end 
    end
    
    def title
      @title ||= case format
        when 'video' then page.search("h1#item_title").inner_html
        when 'photo' then page.search("h4#item_desc").inner_html
      end
    end
    
    def html(size = {})
      @html = page.search("#embed input.text").first.attributes['value'].gsub!(/(<br .+)|(<div .+)/, '')
      @html.gsub!(/height="\d+"/, %{height="#{size[:height]}"}) if size[:height]
      @html.gsub!(/width="\d+"/, %{width="#{size[:width]}"}) if size[:width]
      @html
    end
    
    def self.match(url)
      url.match(/collegehumor\.com/)
    end
    
    def page
      @page ||= Hpricot(open(@url))
    end
    
  end
  
end

# <object type="application/x-shockwave-flash" data="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=1833349&fullscreen=1" width="480" height="360" ><param name="allowfullscreen" value="true" /><param name="AllowScriptAccess" value="true" /><param name="movie" quality="best" value="http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=1833349&fullscreen=1" /></object><div style="padding:5px 0; text-align:center; width:480px;">See more <a href="http://www.collegehumor.com/videos">funny videos</a> and <a href="http://www.collegehumor.com/pictures">funny pictures</a> at <a href="http://www.collegehumor.com/">CollegeHumor</a>.</div>