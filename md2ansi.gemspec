# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'md2ansi/version'

Gem::Specification.new do |gem|
  gem.name          = "md2ansi"
  gem.version       = Md2Ansi::VERSION
  gem.authors       = ["Jianwei Han"]
  gem.email         = ["hanjianwei@gmail.com"]
  gem.description   = %q{Converts markdown to ansi.}
  gem.summary       = %q{markdown to ansi. }
  gem.homepage      = "https://github.com/hanjianwei/md2ansi"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('redcarpet', "~> 2.2")
  gem.add_runtime_dependency('ansi', "~> 1.4")
  gem.add_runtime_dependency('pygments.rb', "~> 0.4")

  gem.add_development_dependency "bundler", ">= 1.3"
end
