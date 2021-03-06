# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "rspec-smart-formatter"
  s.version     = '0.0.4'
  s.authors     = ["iain"]
  s.email       = ["iain@iain.nl"]
  s.homepage    = "https://github.com/iain/rspec-smart-formatter"
  s.summary     = %q{Automatically chooses a handy formatter}
  s.description = %q{When you run individual specs, I want to see documentation output, because it shows better which specs fails. But when I run all my specs I want something like progress or Fuubar.}

  s.rubyforge_project = "rspec-smart-formatter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "turnip"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "rspec-core", "~> 2.0"
end
