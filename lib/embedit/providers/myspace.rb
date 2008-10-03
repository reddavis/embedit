module Embedit
  
  class Myspace
    
    attr_reader :url, :title, :format
    
    def initialize(url)
      @url = url
      @format = 'picture'
    end
    
    def title
      @title ||= page.at("div#caption span").inner_html
    end
    
    def html(size = {})
      attributes = size.collect {|k,v| "#{k}=\"#{v}\" "}.join(" ")
      puts src = page.at("img#userImage").to_s.slice(/src=.+\.\w+/)
      %{
        <a href="#{@url}"><img src="#{src}" #{attributes}/></a>
      }
    end
    
    def self.match(url)
      url.match(/viewmorepics\.myspace\.com/)
    end
    
    private
    
    def page
      @page ||= Hpricot(open(@url))
    end
    
  end
end
