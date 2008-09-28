# TODO Having problems with using in rails (files not being found), need to look into. But works perfectly find with www.pandastream.com
module Embedit
  
  class Player
  
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
    end
            
    def html(size = {})
      self.html = @url  # Reset measurements, incase if hmtl is called twice on the same object
      @html.gsub!(/400/, size[:width].to_s) unless size[:width].nil?
      @html.gsub!(/300/, size[:height].to_s) unless size[:height].nil?
      @html
    end
    
    def html=(url)
      @html = %(<embed src="http://s3.amazonaws.com/panda-test/player.swf" width="400" height="300" 
      allowfullscreen="true" allowscriptaccess="always" 
      flashvars="&displayheight=300&file=#{url}&width=400&height=300" />)
    end
    
  end
  
end
