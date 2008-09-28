Gem::Specification.new do |s|
  s.name = "embedit"
  s.version = '0.0.7'
  s.date = Time.now.to_s
  s.summary = "Ruby interface for embedding a range of media"
  s.email = "reddavis@gmail.com"
  s.homepage = "http://github.com/reddavis/embedit/"
  s.has_rdoc = false
  s.authors = ["Red Davis"]
  s.files = ["README", "lib/embedit.rb", "lib/providers.yaml", "lib/embedit/media.rb", 
             "lib/embedit/oembed/providers.rb", "lib/embedit/youtube/youtube.rb", "lib/embedit/oembed/oembed.rb",
             "lib/embedit/exceptions.rb", "lib/embedit/validate.rb", "lib/embedit/ovi/ovi.rb", "lib/embedit/player/player.rb",
             "spec/spec_helper.rb", "spec/oembed_spec.rb", "spec/youtube_spec.rb", 
             "spec/ovi_spec.rb", "spec/player_spec.rb"]
end