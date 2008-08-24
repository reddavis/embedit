module Oembed
  
  class YouTube
    
    BASE_URL = "http://www.youtube.com/api2_rest"
    
    attr_accessor :format, :media_url
    
    def initialize(url)
      @url = url
      set_attributes
    end
    
    def format
      'video'
    end
    
    def media_url
      @url
    end
    
    def html
      id = @url.scan(/v=([^=|\&]*)/)
      "<object width='425' height='344'><param name='movie' value='http://www.youtube.com/v/#{id}'>
      </param><param name='allowFullScreen' value='true'></param><embed src='http://www.youtube.com/v/#{id}' 
      type='application/x-shockwave-flash' allowfullscreen='true' width='425' height='344'></embed></object>"
    end
    
  end
  
end

#<object width="425" height="344"><param name="movie" value="http://www.youtube.com/v/cuCw5k-Lph0&hl=en&fs=1">
#</param><param name="allowFullScreen" value="true"></param><embed src="http://www.youtube.com/v/cuCw5k-Lph0&hl=en&fs=1" 
#type="application/x-shockwave-flash" allowfullscreen="true" width="425" height="344"></embed></object>

#<object width='425' height='344'><param name='movie' value='http://www.youtube.com/watch?v=cuCw5k-Lph0&hl=en&fs=1'>
#</param><param name='allowFullScreen' value='true'></param><embed src='http://www.youtube.com/watch?v=cuCw5k-Lph0&hl=en&fs=1' 
#type='application/x-shockwave-flash' allowfullscreen='true' width='425' height='344'></embed></object>



puts a = Oembed::YouTube.new("http://www.youtube.com/watch?v=cuCw5k-Lph0").html