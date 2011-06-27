# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mm-optimistic_locking"

Gem::Specification.new do |s|
  s.name        = "mm-optimistic_locking"
  s.version     = MongoMapper::Plugins::OptimisticLocking::VERSION
  s.authors     = ["Andy Lindeman"]
  s.email       = ["andy@highgroove.com"]
  s.homepage    = "http://github.com/highgroove/mm-optimistic_locking"
  s.summary     = %q{Implements optimistic locking (similar to ActiveRecord) for MongoMapper}
  s.description = %q{Before a record is saved, mm-optimistic_locking will check if it has been modified by another process. If so, a StaleDocumentError will be raised. The object can be reloaded and resaved after the conflict has been resolved.}

  s.files         = [
    ".gitignore",
    "Gemfile",
    "Rakefile",
    "lib/mm-optimistic_locking.rb",
    "lib/mongo_mapper/stale_document_error.rb",
    "mm-optimistic_locking.gemspec",
  ]

  s.test_files    = [
  ]

  s.executables   = [
  ]

  s.require_paths = ["lib"]

  s.add_dependency 'mongo_mapper', '~>0.9.0'
  s.add_dependency 'activesupport', '~>3.0'

  s.add_development_dependency 'rspec', '~>2.6.0'
end
