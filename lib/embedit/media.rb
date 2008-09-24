module Embedit
  
  class Media
    
    attr_reader :title, :url, :format, :html
    
    def initialize(url)
      @valid = true                                                 #Innocent until proven guilty
      @oembed_providers = Providers.new.sites 
      find_provider(url)
      rescue                                                        #Horrible hack, but flickrs poor status headers == :( 
        @valid = false                                              #if it breaks, its gotta be invalid, I suggest removing when debugging                                                 
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
      @valid    
    end
    
         
    private    

  #Find a provider
    def find_provider(url)
      return @valid = false unless Validate.new(url).valid?
      
      @oembed_providers.keys.each do |key|                               #First search oembed providers for a match
        if url.match(/(\.|\/)#{key}\./)                                  #URL can be www.vimeo.com || http://vimeo.com
          return @media_data = Oembed.new(url, key)
        end
      end
      if url.match(/(\.|\/)youtube\./)                                  #Next up is YouTube
        return @media_data = YouTube.new(url)
      elsif url.match(/share\.ovi\.com/)
        return @media_data = Ovi.new(url)
      elsif File.extname(url) != "" || nil
        return @media_data = Player.new(url)
      end
        @valid = false
    end
  end
end
