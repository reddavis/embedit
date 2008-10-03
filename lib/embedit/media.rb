module Embedit
  
  class Media
    
    attr_accessor :title, :url, :format, :html, :provider
    
    
    #delegate :title, :html, :format, :to => :provider
    
    def initialize(url)
      @valid    = true
      @url      = url
      @provider = Provider.find(url)
      # The validation does a expensive GET request. needs to be fixed. (request only the headers?!) 
      if !@provider || !Validate.new(@url).valid?
        @valid = false
        return
      end 

    rescue #Horrible hack, but flickrs poor status headers == :( 
      @valid = false #if it breaks, its gotta be invalid, I suggest removing when debugging                                                 
    end
    
    def title
      self.provider.title if self.provider
    end
    
    def html(args={})
      args = {} if args.nil?
      self.provider.html(args) if self.provider    
    end
    
    def format
      self.provider.format if self.provider
    end
    
    def valid?
      @valid    
    end
    
  end
end
