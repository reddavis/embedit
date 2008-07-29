require 'rubygems'
require 'json'
require 'net/http'
require 'uri'

files = File.join(File.dirname(__FILE__), 'providers', '*.rb')
Dir.glob(files).each {|file| require file}

module Oembed
  
end

a = Oembed::Flickr.new("http://www.flickr.com/photos/erkan/428665273/")
puts a.title
puts a.type
puts a.provider
puts a.url

b = Oembed::Vimeo.new("http://www.vimeo.com/1263214")
puts b.title
puts b.html

c = Oembed::Viddler.new("http://www.viddler.com/explore/cdevroe/videos/424/")
puts c.title
puts c.html
puts c.url