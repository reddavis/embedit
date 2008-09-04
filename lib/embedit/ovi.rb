#http://share.ovi.com - They have no API so screen scrape probably best solution here

module Embedit
  
  class Ovi
    require 'hpricot'
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      page = Hpricot(open(url))
      @url= url
      work_out_html(page)
      work_out_format(@html)
      @title = page.search("h2.pagetitle").inner_html.strip
    end
    
    def html(size = {})
      @html.gsub!(/height="\d+"/, %{height="#{size[:height]}"}) if size[:height]
      @html.gsub!(/width="\d+"/, %{width="#{size[:width]}"}) if size[:width]
      @html
    end
    
    private
    
    def work_out_html(page)
      @html = page.search("tr#M_sidebar_uimediaembed_uifp1 td input").first.attributes['value'] rescue nil  #We first search for video or audio, if not its got to be image (hopfully)
      if @html.nil?
        @html = page.search("div#M_sidebar_uimediaembed_uiip td input#M_sidebar_uimediaembed_uihtml2").first.attributes['value']
      end
    end
    
    def work_out_format(html)
      case html
        when /flash\/player\.aspx\?media/ then @format = 'video'
        when /flash\/audioplayer\.aspx\?media/ then @format = 'audio'
        when /<img src/ then @format = 'photo'
      end
    end
    
  end
end

#audio
#<embed src="http://share.ovi.com/flash/audioplayer.aspx?media=ekki808.10001&channelname=ekki808.mu-sick" width="145" height="60" type="application/x-shockwave-flash"></embed>

#video
#<embed src="http://share.ovi.com/flash/player.aspx?media=DefragTV.10014&channelname=DefragTV.public" width="512" height="420" type="application/x-shockwave-flash"></embed>

#image
#<a href="http://share.ovi.com/media/james___.public/james___.10016"><img src="http://media.share.ovi.com/m1/medium/0233/ffe7143e402341d48ad5440715ecafa6.jpg" border="0" title="Tom Arnold at Westbury - Share on Ovi" alt="Tom Arnold at Westbury - Share on Ovi" width="256" height="144" /></a>

#<embed src="http://share.ovi.com/flash/player.aspx?media=DefragTV.10014&channelname=DefragTV.public" width="512" height="420" 
      #type="application/x-shockwave-flash"></embed>
      
#http://share.ovi.com/media/DefragTV.public/DefragTV.10014