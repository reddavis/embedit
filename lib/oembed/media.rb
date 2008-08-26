module Oembed
  
  class Media < Providers
    
    attr_accessor :title, :media_url, :format, :html
        
    def initialize(url)
      @format = 'json'
      @url = url
      @sites = Oembed::Providers.new.sites 
      get_info
    end
    
    def html(size = {})
      if @format == 'photo'
        @html.insert(-2, " height=#{size[:height]} ") unless size[:height].nil?
        @html.insert(-2, " width=#{size[:width]}") unless size[:width].nil?
      else
        @html.gsub!(/height="\d+"/, %{height="#{size[:height].to_s}"}) unless size[:height].nil?
        @html.gsub!(/width="\d+"/, %{width="#{size[:width].to_s}"}) unless size[:width].nil?
      end
      @html
    end
      #width="504" height="380"        
    private    
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
      @html = @format == 'video' ? parsed_data['html'] : %{<img src='#{@media_url}' alt='#{@title}'>}
    end
        
    #find Oembed provider - set in ../providers.yaml
    def find_provider
      @sites.keys.each do |key|
        if @url.match(/#{key}/)
          @base_url = prepare_url(@sites[key])
        end
      end
    end
    #some urls contain format in the middle of the url
    def prepare_url(url)
      if url.match(/format/)
        @base_url = "#{url.gsub(/\{format\}/, @format)}" + '?url='
      else
        @url = @url + '&format=json'
        @base_url = url + '?url='
      end
    end
    
    def check_for_other_service
      
      #if @url.match(/youtube/)
        #Oembed::YouTube.new(@url)
      #end
    end
    
  end
end
