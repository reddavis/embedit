module Embedit
  
  class Media
    
    attr_reader :title, :url, :format, :html
    
    def initialize(url)
      @valid = true
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
    
    def valid?
      @valid         #Guilty until proven innocent
    end
    
         
    private    

  #Find a provider
    def find_provider(url)
      @oembed_providers.keys.each do |key|                               #First search oembed providers for a match
        if url.match(/(\.|\/)#{key}\./) && Validate.new(url).valid?      #URL can be www.vimeo.com || http://vimeo.com
          return @media_data = Oembed.new(url, key)
        end
      end
      if url.match(/(\.|\/)youtube\./) && Validate.new(url).valid?       #Next up is YouTube
        return @media_data = YouTube.new(url)
      end
        @valid = false
        #raise Embedit::BadUrl.new('URL is not recognised/supported')
    end

  end
end
