# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chuyi_helper2/version'

Gem::Specification.new do |gem|
  gem.name          = "chuyi_helper2"
  gem.version       = ChuyiHelper2::VERSION
  gem.authors       = ["Chuyi Huang"]
  gem.email         = ["chuyihuang@gmail.com"]
  gem.description   = %q{Chuyi's helpers version 2}
  gem.summary       = %q{Chuyi's helpers version 2}
  gem.homepage      = ""
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
