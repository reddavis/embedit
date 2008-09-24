class Validate
  
  def initialize(url)
    @url = url
    @valid = check_url == true ? true : false
  end
  
  def valid?
    @valid
  end
    
  private
  
  def check_url    
    if check_url_supported == true && check_response == true   #We first check that the url is one actually supported by Embedit
      return true
    end
  end
  
  def check_response
    true if open(@url)    #Header codes are annoying, just check that the page works, the check with Embed::Media will narrow down more
    rescue 
      false
  end
  
  def check_url_supported
    oembed_providers = Embedit::Providers.new.sites
    oembed_providers.keys.each do |key|                       #First search oembed providers for a match
      if @url.match(/(\.|\/)#{key}\./)                        #URL can be www.vimeo.com || http://vimeo.com
        return true
      end
    end
    # Now we go through all services not linked with oEmbed
    if @url.match(/(\.|\/)youtube\./)                         #All youtube links should end with a .com (Please correct if I'm wrong) they get redirected to jp.youtube.com or whatever                      
      return true 
    elsif @url.match(/share\.ovi\.com/)
      return true
    elsif File.extname(@url).match(/\.flv/)
      return true
    end
    return false                                              #Return false if all else fail
  end
  
end
