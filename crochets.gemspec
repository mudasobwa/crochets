$:.push File.expand_path("../lib", __FILE__)
require 'crochets/version'

Gem::Specification.new do |s|
  s.name = 'crochets'
  s.version = Crochets::VERSION
  s.platform = Gem::Platform::RUBY
  s.date = '2013-12-26'
  s.authors = ['Alexei Matyushkin']
  s.email = 'am@mudasobwa.ru'
  s.homepage = 'http://github.com/mudasobwa/crochets'
  s.summary = %Q{Library to utilize setting hooks on Ruby classes}
  s.description = %Q{Easy setting of hook chains on Ruby methods calls in rubtime}
  s.extra_rdoc_files = [
    'LICENSE',
    'README.md',
  ]

  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.7')
  s.rubygems_version = '1.3.7'
  s.specification_version = 3

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'cucumber'

  s.add_dependency 'aquarium'
end

