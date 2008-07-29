module Oembed
  class Vimeo
    BASE_URL = "http://www.vimeo.com/api/oembed."
    
    attr_accessor :html, :title, :provider
    
    def initialize(url, format = :json)
      @format = format
      get_data(url)
    end
    
    private
    
    def get_data(url)
      media = BASE_URL + @format.to_s + "?url=#{url}"
      fetch_that = Net::HTTP.get(URI.parse(media))
      set_attributes(fetch_that)
    end
    
    def set_attributes(att)
      media = JSON.parse(att)
      @html, @title, @provider = media['html'], media['title'], media['provider']
    end
    
  end
end