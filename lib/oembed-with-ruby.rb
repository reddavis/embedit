require 'rubygems'
require 'json'
require 'net/http'
require 'uri'
require 'yaml'

#Files
require 'oembed/providers'
require 'oembed/media'
require 'oembed/oembed'
require 'oembed/youtube'


puts a = Embedit::Media.new('http://www.vimeo.com/1263763').url

puts b = Embedit::Media.new('http://www.flickr.com/photos/davidgutierrez/2135724493/').html(:height => 200)

#puts c = Oembed::Media.new('http://www.viddler.com/explore/winelibrarytv/videos/142/').html(:height => 200, :width => 500)

#puts d = Oembed::Media.new('http://qik.com/video/141977').html(:height => 50)

#puts e = Oembed::Media.new('http://pownce.com/dburka/notes/2951118/').html(:height => 200)

#puts f = Oembed::Media.new('http://revision3.com/trs/blockoland/').html(:height => 500)

#YouTUBE

#puts g = Oembed::Media.new("http://www.youtube.com/watch?v=j3TOT1lnVTA")