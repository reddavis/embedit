module Oembed
  class Flickr
    BASE_URL = "http://www.flickr.com/services/oembed/?url="
    
    attr_accessor :url, :title, :type, :provider
    
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
      @url, @title, @type, @provider = media['url'], media['title'], media['type'], media['provider_name']
    end
  end
end