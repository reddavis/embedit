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
        if url.match(/(\.|\/)#{key}\./)         #URL can be www.vimeo.com || http://vimeo.com
          return @media_data = Oembed.new(url, key)
        end
      end
      if url.match(/(\.|\/)youtube\./)                  #Next up is YouTube
        return @media_data = YouTube.new(url)
      end
        raise Embedit::BadUrl.new('URL is not recognised/supported')
    end

  end
end
