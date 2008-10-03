module Embedit

  class SevenloadVideo
  
    attr_reader :title, :url, :format, :video_id, :lang
  
    def initialize(url)
      @format = 'video'
      @url = url
      get_info
    end
    
    def html(options = {})
      options.reverse_merge!({:width=>445,:height=>364})
      %{
        <object type="application/x-shockwave-flash" data="http://#{lang}.sevenload.com/pl/#{video_id}/#{options[:width]}x#{options[:height]}/swf" width="#{options[:width]}" height="#{options[:height]}">
          <param name="allowFullscreen" value="true" />
          <param name="allowScriptAccess" value="always" />
          <param name="movie" value="http://#{lang}.sevenload.com/pl/#{video_id}/#{options[:width]}x#{options[:height]}/swf" />
        </object>
      }
    end
    
    def title
      page.at("#itemTitle").inner_html
    end
    
    def self.match(url)
      url.match(/(\w+)\.sevenload\.\S{2,}\/(videos|videolar|filmy|video)?\/(\w+)[\/]?([\S]+)/xi) || url.match(/(\w+)\.sevenload\.\S{2,}\/(shows|sendungen|yayinlar|emissions|trasmissione|audycje)?\/(\S+)\/(episodes|folgen|bolumler|puntate)?\/(\w+)[\/]?([\S]+)/xi)
    end
    
    private
    
    def page
      @page ||= Hpricot(open(@url))
    end
    
    def get_info
      match = self.class.match(@url)
      @lang = match[1]
      # the video id is always the second last match
      @video_id = match[-2]
    end
    
  end

end
