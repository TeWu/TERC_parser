# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "terc_parser/version"

Gem::Specification.new do |s|
  s.name          = "terc_parser"
  s.version       = TercParser::VERSION
  s.authors       = ["TeWu"]
  s.email         = ["tewu.dev@gmail.com"]
  s.homepage      = "https://github.com/TeWu/TERC_parser"
  s.summary       = %q{Nazwy województw, powiatów i gmin w jednym Hashu}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 3.5"
  s.add_runtime_dependency "nokogiri", "~> 1.6"
  s.add_runtime_dependency "activesupport", "~> 5.0"
end
