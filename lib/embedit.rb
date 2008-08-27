require 'rubygems'
require 'json'
require 'rexml/document'
require 'net/http'
require 'open-uri'
require 'yaml'

#Files
require 'embedit/providers'
require 'embedit/media'
require 'embedit/oembed'
require 'embedit/youtube'
require 'embedit/exceptions'
require 'embedit/validate'


#puts a = Embedit::Media.new('http://www.vimeo.com/1263763').valid?

#puts b = Embedit::Media.new('http://www.flickr.com/photos/kentfield/2735062540/').valid? #.valid #.html(:height => 200)

#puts c = Embedit::Media.new('http://www.viddler.com/explore/winelibrarytv/videos/14212300/').html(:height => 200, :width => 500)

#puts d = Embedit::Media.new('http://qik.com/video/141977').html(:height => 50)

#puts e = Embedit::Media.new('http://pownce.com/dburka/notes/2951118/').html(:height => 200)

#puts f = Embedit::Media.new('http://revision3.com/trs/blockoland/').html(:height => 500)

#YouTUBE

#puts g = Embedit::Media.new("http://www.youtube.com/watch?v=j3TOT1lnVTA")

#puts Validate.new('http://www.flickr.com/photos/kentfield/2735062540/').valid?

