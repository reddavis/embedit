module Embedit
  
  class Player
    
    FLASH_PLAYER = File.expand_path('..', __FILE__) + '/../../player/player.swf'
    SWF_OBJECT = File.expand_path('..', __FILE__) + '/../../player/swfobject.js'
#    MEDIA_PATH = File.dirname(__FILE__) + '/../../'
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      self.url = url
      self.html = @url
    end
    
    def url=(path)
      @url = File.expand_path(path)
    end
    
    def html(size = {})
      @html
    end
    
    def html=(url)
      @html = %{
        <div id='preview'></div>
        <script type='text/javascript' src='#{SWF_OBJECT}'></script>
        <script type='text/javascript'>
        var s1 = new SWFObject('#{FLASH_PLAYER}','player','400','300','9');
        s1.addParam('allowfullscreen','true');
        s1.addParam('allowscriptaccess','always');
        s1.addParam('flashvars','file=#{url}');
        s1.write('preview');
        </script>
        }
    end
    
  end
  
end