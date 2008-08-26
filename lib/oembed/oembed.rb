module Embedit
  
  class Oembed
    
    attr_accessor :title, :url, :format, :html
    
    def initialize(url)
      @format = 'json'
      @input_url = url
      @sites = Providers.new.sites 
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
        
    private    
    def get_info
      find_provider
      url = URI.parse(@base_url + @input_url)
      http_get = Net::HTTP.get(url)
      set_attributes(http_get)
    end

    def set_attributes(att)
      parsed_data = JSON.parse(att)
      @title = parsed_data['title']
      @url = parsed_data['url'] ||= @input_url
      @format = parsed_data['type']
      @html = @format == 'video' ? parsed_data['html'] : %{<img src='#{@url}' alt='#{@title}'>}
    end
    
    #find Oembed provider - set in ../providers.yaml
    def find_provider
      @sites.keys.each do |key|
        if @input_url.match(/#{key}/)
          @base_url = prepare_url(@sites[key])
          break
        end
      end
    end
    
    #some urls contain format in the middle of the url
    def prepare_url(url)
      if url.match(/format/)
        @base_url = "#{url.gsub(/\{format\}/, @format)}" + '?url='
      else
        @input_url = @input_url + '&format=json'
        @base_url = url + '?url='
      end
    end    
  end
  
end