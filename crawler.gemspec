# encoding: UTF-8

lib = File.expand_path('lib')
$:.unshift(lib) unless $:.include?(lib)

require 'crawler/version'

Gem::Specification.new do |s|
  s.name        = "crawler"
  s.version     = Crawler::VERSION
  s.authors     = ["Thibault Gautriaud"]
  s.email       = ["thibault.gautriaud@gmail.com"]
  s.summary     = "A simple web page crawler"
  s.description = "A simple web page crawler that outputs static assets"
  s.homepage    = "https://github.com/hubb/crawler"

  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rspec', '~> 3.3', '>= 3.3.0'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*/*_spec*`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.license      = 'MIT'
end