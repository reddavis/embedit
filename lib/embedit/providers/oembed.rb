module Embedit
  
  class Oembed
    
    @@list = {
      /flickr\.com\/photos\/(\S+)\/([0-9A-Za-z]+)/xi => { :name => "flickr", :api_url => "http://www.flickr.com/services/oembed" },
      /pownce/ => { :name => "pownce", :api_url => "http://api.pownce.com/2.1/oembed.{format}" },
      /revision3/ => { :name => "pownce", :api_url => "http://revision3.com/api/oembed/" },
      /qik\.com\/video\/(\d+)/xi => { :name => "qik", :api_url => "http://qik.com/api/oembed.{format}" },
      /viddler\.com(\/explore)?\/([^\/,\s]+)\/videos\/([^\/,\s]+)/xi => { :name => "viddler", :api_url => "http://lab.viddler.com/services/oembed/" },
      /vimeo\.com\/(\d+)/xi => { :name => "vimeo", :api_url => "http://www.vimeo.com/api/oembed.{format}" },
      /slideshare/ => {:name => "slideshare", :api_url => "http://oohembed.com/oohembed/"},
      /amazon\.(com|co.uk|de|ca|jp)\/(.*)(gp\/product|o\/ASIN|obidos\/ASIN|dp)\/(.*)/ => {:name => "amazon", :api_url => "http://oohembed.com/oohembed/"}
    }
    
    attr_reader :title, :url, :format, :html
    
    def initialize(url)
      @input_url = url

      get_provider_for(url)
      get_info
    end

    def html(size = {})
      if @format == 'photo'                                                                           #Photos use image tags
        @html.insert(-2, " height=#{size[:height]} ") unless size[:height].nil?
        @html.insert(-2, " width=#{size[:width]}") unless size[:width].nil?
      else
        @html.gsub!(/height="\d+"/, %{height="#{size[:height].to_s}"}) unless size[:height].nil?
        @html.gsub!(/width="\d+"/, %{width="#{size[:width].to_s}"}) unless size[:width].nil?
      end
      @html
    end
    
    def self.match(url)
      @@list.keys.each do |regex|
        m = url.match(regex)
        return m if m
      end
      nil # if none matches
    end
    
    private    
    
    def get_provider_for(url)
      @@list.each do |regex, provider|
        @provider = provider and break if url.match(regex)
      end
      @provider
    end
    
    def get_info
      base_url = prepare_url(@provider[:api_url])       #Prepare the base_url
      url = URI.parse(base_url + @input_url)
      api_data = Net::HTTP.get(url)                  #Get the data
      set_attributes(api_data)
    end
    
    def set_attributes(att)
      parsed_data = JSON.parse(att)                           
      @title = parsed_data['title']
      @url = parsed_data['url'] ||= @input_url
      @format = parsed_data['type']
      @html = @format == 'video' ? parsed_data['html'] : %{<img src='#{@url}' alt='#{@title}'>}   #Image tags
    end
        
    #some urls contain format in the middle of the url
    def prepare_url(url)
      if url.match(/format/)
        return "#{url.gsub(/\{format\}/, 'json')}" + '?url='
      else
        @input_url = @input_url + '&format=json'
        return url + '?url='
      end
    end    
  end
  
end