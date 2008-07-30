This is/will (be) a very simple oEmbed wrapper in Ruby and will be accompanied by a Rails plugin.

To Use

a = Oembed::Media('put the url here')

You are then given attributes such as...

a.title
a.media_url - link to the media
a.html - a flash player, (only for videos)
a.format - video/photo


Services Supported

Flickr
  
Vimeo

Viddler

Qik

Pownce

Revision3

Hulu - You may get problems if the server your using it on is not in the US