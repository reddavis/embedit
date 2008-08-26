module Embedit

  class YouTube
  
    attr_accessor :title, :url, :format, :html
  
    def initialize(url)
      @input_url = url
      get_info
    end
    
    private
    
    def get_info
      video_id = extract_url(@input_url)
    end
    
    def extract_id(url)
      url.scan(/v=([\w\d]+)/)
    end
  
  end

end

puts Embedit::YouTube.new("http://www.youtube.com/watch?v=j3TOT1lnVTA")