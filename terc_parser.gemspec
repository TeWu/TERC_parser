# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "terc_parser/version"

Gem::Specification.new do |s|
  s.name          = "terc_parser"
  s.version       = TercParser::VERSION
  s.authors       = ["TeWu"]
  s.email         = ["wm.tewu@gmail.com"]
  s.homepage      = ""
  s.summary       = %q{Nazwy województw, powiatów i gmin w jednym Hashu}
  s.description   = %q{}

  #s.rubyforge_project = "terc_parser"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "active_support"
end
