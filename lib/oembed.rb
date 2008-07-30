require 'rubygems'
require 'json'
require 'net/http'
require 'uri'
require 'yaml'

#problems with loading
#files = File.join(File.dirname(__FILE__), 'oembed', '*.rb')
#Dir.glob(files).each {|file| require file}

require 'oembed/providers'
require 'oembed/media'


puts a = Oembed::Media.new('http://www.vimeo.com/1263763').title

puts b = Oembed::Media.new('http://www.flickr.com/photos/davidgutierrez/2135724493/').title

puts c = Oembed::Media.new('http://www.viddler.com/explore/winelibrarytv/videos/142/').title

puts d = Oembed::Media.new('http://qik.com/video/141977').title

puts e = Oembed::Media.new('http://pownce.com/dburka/notes/2951118/').title
