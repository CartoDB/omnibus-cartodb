# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "omnibus-cartodb"
  s.version     = "1.0.0"
  s.authors     = ['Bloomberg L.P.']
  s.summary     = %q{Omnibus project for all core CartoDB infrastructure}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'berkshelf', '~> 3.1.0'
end
