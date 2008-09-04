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