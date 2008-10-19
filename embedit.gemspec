Gem::Specification.new do |s|
  s.name = %q{embedit}
  s.version = "0.1.2"

  s.authors = ["Red Davis", "Michael Bumann", "James Smith"]
  s.date = Time.now.to_s
  s.email = "reddavis@gmail.com"
  s.files = ["lib/embedit/exceptions.rb", "lib/embedit/media.rb", "lib/embedit/provider.rb", "lib/embedit/providers/flv.rb", "lib/embedit/providers/google_video.rb", 
            "lib/embedit/providers/image.rb", "lib/embedit/providers/ipernity.rb", "lib/embedit/providers/myspace.rb", "lib/embedit/providers/oembed.rb", 
            "lib/embedit/providers/ovi.rb", "lib/embedit/providers/sevenload_video.rb", "lib/embedit/providers/twitter.rb", "lib/embedit/providers/youtube.rb", "lib/embedit/providers/mp3.rb", "lib/embedit/providers/swf.rb", 
            "lib/embedit/validate.rb", "lib/embedit.rb", "README", "spec/google_video_spec.rb", "spec/oembed_spec.rb", "spec/ovi_spec.rb", "spec/player_spec.rb", 
            "spec/sevenload_video_spec.rb", "spec/twitter_spec.rb", "spec/youtube_spec.rb", "spec/mp3_spec.rb", "spec/swf_spec.rb"]
            
  s.homepage = %q{http://github.com/reddavis/embedit}
  s.require_paths = ["lib"]
  s.summary = %q{Ruby interface for embedding a range of media.}
  s.test_files = ["spec/google_video_spec.rb", "spec/oembed_spec.rb", "spec/ovi_spec.rb", "spec/player_spec.rb", "spec/sevenload_video_spec.rb", "spec/twitter_spec.rb", "spec/youtube_spec.rb", "spec/mp3_spec.rb", "spec/swf_spec.rb"]

end
