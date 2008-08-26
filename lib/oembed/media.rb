module Embedit
  
  class Media
    
    attr_accessor :title, :url, :format, :html
    
    def initialize(url)
      @oembed_providers = Providers.new.sites 
      find_provider(url)
    end
    
    def title
      @media_data.title
    end
    
    def html(size = {})
      @media_data.html(size)
    end
    
    def format
      @media_data.format
    end
    
    def url
      @media_data.url
    end
     
    private    

  #Find a provider
    def find_provider(url)
      @oembed_providers.keys.each do |key|      #First search oembed providers for a match
        if url.match(/#{key}/)
          @media_data = Oembed.new(url)
          return
        end
      end
      if @url.match(/youtube/)
        @media_data = YouTube.new(@url)
        return
      end
    end

  end
end
