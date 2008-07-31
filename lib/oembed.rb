require 'rubygems'
require 'json'
require 'net/http'
require 'uri'
require 'yaml'

#Files
require 'oembed/providers'
require 'oembed/media'


#puts a = Oembed::Media.new('http://www.vimeo.com/1263763').title

#puts b = Oembed::Media.new('http://www.flickr.com/photos/davidgutierrez/2135724493/').title

#puts c = Oembed::Media.new('http://www.viddler.com/explore/winelibrarytv/videos/142/').title

#puts d = Oembed::Media.new('http://qik.com/video/141977').title

#puts e = Oembed::Media.new('http://pownce.com/dburka/notes/2951118/').title

#puts f = Oembed::Media.new('http://revision3.com/trs/blockoland/').html