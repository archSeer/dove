$:.unshift File.expand_path("../lib", __FILE__)
require "dove/version"

Gem::Specification.new do |s|
  s.platform      = Gem::Platform::RUBY
  s.name          = 'dove'
  s.version       = Dove::VERSION
  s.homepage      = 'https://github.com/archSeer/dove'
  s.authors       = ["Blaž Hrastnik"]
  s.email         = ['speed.the.bboy@gmail.com']
  s.summary       = "Write single page HTML documents with ease"
  s.description   = "Write single page HTML documents with ease"

  s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = ["dove"]
  s.require_paths = ["lib"]

  s.add_dependency 'redcarpet', '~> 2.3.0'
  s.add_dependency 'tilt', '~> 1.4.1'
  s.add_dependency 'slim', '~> 2.0'
  s.add_dependency 'rouge', '~> 0.3.7'
end
