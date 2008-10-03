#http://share.ovi.com - They have no API so screen scrape probably best solution here
module Embedit
  
  class Ovi
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
    end
    
    def html(size = {})
      @html = original_html
      @html.gsub!(/height="\d+"/, %{height="#{size[:height]}"}) if size[:height]
      @html.gsub!(/width="\d+"/, %{width="#{size[:width]}"}) if size[:width]
      @html
    end
    
    def title
      @title ||= page.at("h2.pagetitle").inner_html.strip
    end
    
    def format
      @format ||= case self.original_html
        when /flash\/player\.aspx\?media/ then 'video'
        when /flash\/audioplayer\.aspx\?media/ then 'audio'
        when /<img src/ then 'photo'
      end
    end
  
    def self.match(url)
      url.match(/share\.ovi\.com/)
    end
    
    def page
      @page ||= Hpricot(open(@url))
    end

    def original_html
      return @original_html if @original_html
      @original_html = page.search("tr#M_sidebar_uimediaembed_uifp1 td input").first.attributes['value'] rescue nil  #We first search for video or audio, if not its got to be image (hopfully)
      if @original_html.nil?
        @original_html = page.search("div#M_sidebar_uimediaembed_uiip td input#M_sidebar_uimediaembed_uihtml2").first.attributes['value'].gsub(/<a \S+>/, '').gsub(/<\/a>/, '')  #Follow Embedit convention, images should not be surrounded a a <a href></a>
      end
      @original_html
    end
    
  end
end