module Oembed
  class Viddler
    BASE_URL = "http://lab.viddler.com/services/oembed/?url="
    
    attr_accessor :url, :html, :title, :provider
    
    def initialize(url, format = :json)
      @format = format
      get_data(url)
    end
    
    private
    
    def get_data(url)
      media = BASE_URL + url + "&format=#{@format}"
      fetch_that = Net::HTTP.get(URI.parse(media))
      set_attributes(fetch_that)
    end
    
    def set_attributes(att)
      media = JSON.parse(att)
      @url, @html, @title, @provider = media['url'], media['html'], media['title'], media['provider']
    end
    
  end
end