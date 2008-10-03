module Embedit

  class GoogleVideo
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @url = url
      @format = "video"
    end
    
    def html(options={})
      options.reverse_merge!(:width=>400, :height=>326)
      %{<embed id="VideoPlayback" src="http://video.google.com/googleplayer.swf?docid=#{doc_id}&hl=en&fs=true" style="width:#{options[:width]}px;height:#{options[:height]}px" allowFullScreen="true" allowScriptAccess="always" type="application/x-shockwave-flash"> </embed>}
    end
    
    def doc_id
      @url[/video\.google\.com\/videoplay\?docid=(\w+)/,1]
    end
    
    def title
      return @title if @title
      @page = Hpricot(open(@url))
      @title = @page.at("title").inner_html if @page.at("title")
    end
    
    def self.match(url)
      url.match(/video\.google\.com\/videoplay\?docid=(\w+)/)
    end
  end

end
