require 'rake'
require File.join(File.dirname(__FILE__), 'spec', 'spec_helper')
require "spec/rake/spectask"
require 'rake/gempackagetask'

task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/*.rb']
  t.rcov = false
end


spec = Gem::Specification.new do |s|
  s.name = "embedit"
  s.version = '0.0.9'
  s.summary = "Ruby interface for embedding a range of media."
  s.authors = ["Red Davis", "Michael Bumann"]
  s.email = "michael@railslove.com"
  s.homepage = "http://github.com/bumi/embedit"
  s.has_rdoc = false
  s.test_files = FileList["spec/*_spec.rb"]
  s.files = FileList[
    "lib/**/*.rb",
    "README"
  ]
end
 
Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end
 
desc "Build gemspec file"
task :build do
  File.open('embedit.gemspec', 'w') { |f| f.write spec.to_ruby }
end