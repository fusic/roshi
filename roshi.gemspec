# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roshi/version'

Gem::Specification.new do |spec|
  spec.name          = 'roshi'
  spec.version       = Roshi::VERSION
  spec.authors       = ['kawahiro311', 'Kta-M', 'nmbakfm']
  spec.email         = ['hiro.kawasaki0311@gmail.com', 'mohri1219@gmail.com', 'nmbakfm@gmail.com']

  spec.summary       = %q{ActiveModel/ActiveRecord Validation Collection}
  spec.description   = %q{ActiveModel/ActiveRecord Validation Collection For Mainly Japanese}
  spec.homepage      = 'https://github.com/fusic/roshi'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activemodel'
  spec.add_development_dependency 'bundler', "~> 2.3"
  spec.add_development_dependency 'rake', "~> 13.0.6"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
