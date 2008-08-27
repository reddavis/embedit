Gem::Specification.new do |s|
  s.name = "embedit"
  s.version = '0.0.4'
  s.date = Time.now.to_s
  s.summary = "Ruby interface for embedding any media"
  s.email = "reddavis@gmail.com"
  s.homepage = "http://github.com/reddavis/embedit/"
  s.has_rdoc = false
  s.authors = ["Red Davis"]
  s.files = ["README", "lib/embedit.rb", "lib/providers.yaml", "lib/embedit/media.rb", 
             "lib/embedit/providers.rb", "lib/embedit/youtube.rb", "lib/embedit/oembed.rb",
             "lib/embedit/exceptions.rb", "lib/embedit/validate.rb","spec/spec_helper.rb", "spec/oembed_spec.rb"]
end