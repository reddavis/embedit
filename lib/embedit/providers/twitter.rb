module Embedit

  class Twitter
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @format = 'photo'
      @url = url
    end
    
    def html(options = {})
      attributes = options.collect {|k,v| "#{k}=\"#{v}\" "}.join(" ")
      %{<img src="http://twictur.es/i/#{status_id}.gif" #{attributes} />}
    end
    
    def status_id
      @status_id ||= url[/twitter\.com\/(\S+)\/statuses\/(\d+)/,2]
    end
    
    def title
      @title ||= page.at("title").inner_html
    end
        
    def self.match(url)
      url.match(/twitter\.com\/(\S+)\/statuses\/(\d+)/)
    end
  
    private
      
      def page
        @page ||= Hpricot(open(@url))
      end
  end

end
