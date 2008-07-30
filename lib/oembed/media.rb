module Oembed
  
  class Media
    
    attr_accessor :title, :media_url, :html, :format
        
    def initialize(url)
      @format = 'json'
      @url = url
      @sites = Oembed::Providers.new.sites 
      get_info
    end
    
    def get_info
      find_provider
      url = URI.parse(@base_url + @url)
      http_get = Net::HTTP.get(url)
      set_attributes(http_get)
    end
    
    def set_attributes(att)
      parsed_data = JSON.parse(att)
      @title = parsed_data['title']
      @media_url = parsed_data['url']
      @format = parsed_data['type']
      @html = parsed_data['html'] if @format == 'video'
    end
    
        
    private
    
    def find_provider
      @sites.keys.each do |key|
        if @url.match(/#{key}/)
          @base_url = prepare_url(@sites[key])
        end
      end
    end
    
    def prepare_url(url)
      if url.match(/format/)
        @base_url = "#{url.gsub(/\{format\}/, @format)}" + '?url='
      else
        @url = @url + '&format=json'
        @base_url = url + '?url='
      end
    end
    
  end
end
