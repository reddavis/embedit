require 'rubygems'
require 'json'
require 'rexml/document'
require 'net/http'
require 'open-uri'
require 'hpricot'
require 'yaml'

#Files
require 'embedit/provider'
require 'embedit/media'
require 'embedit/exceptions'
require 'embedit/validate'

module Embedit
end

# Oembed

#puts a = Embedit::Media.new('http://www.vimeo.com/1263763').html

#puts b = Embedit::Media.new('http://www.flickr.com/photos/reddavis999/2692043113/').html #valid? #.valid #.html(:height => 200)

#puts c = Embedit::Media.new('http://www.viddler.com/explore/winelibrarytv/videos/147/').format #html(:height => 200, :width => 500)

#puts d = Embedit::Media.new('http://qik.com/video/141977').html(:height => 50)

#puts e = Embedit::Media.new('http://pownce.com/dburka/notes/2951118/').html(:height => 200)

#puts f = Embedit::Media.new('http://revision3.com/trs/blockoland/').html(:height => 500)

# YouTUBE

#puts g = Embedit::Media.new("http://www.youtube.com/watch?v=j3TOT1lnVTA").html

# OVI

#puts a = Embedit::Media.new('http://share.ovi.com/media/PangeaDay.TEDTalks/PangeaDay.10054').html(:height => 900, :width => 100)

#puts b = Embedit::Media.new('http://share.ovi.com/media/DefragTV.public/DefragTV.10014').html#(:height => 900, :width => 100)

#puts c = Embedit::Media.new('http://share.ovi.com/media/james___.public/james___.10016').html(:height => 900, :width => 100)

# Flash Player

#puts a = Embedit::Media.new('http://twitter.com/kastner/statuses/939873832').html

# MySpace Pictures

#puts a = Embedit::Media.new('http://viewmorepics.myspace.com/index.cfm?fuseaction=viewImage&friendID=152417109&albumID=0&imageID=8797852').html(:height => 20)