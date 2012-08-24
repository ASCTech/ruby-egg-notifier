# -*- encoding: utf-8 -*-
require File.expand_path('../lib/egg-notifier/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "egg-notifier"
  gem.version       = Egg::Notifier::VERSION

  gem.authors       = ["mikegee"]
  gem.email         = ["gee.24@osu.edu"]
  gem.homepage      = "https://github.com/ASCTech/ruby-egg-notifier"
  gem.summary       = %q{A Ruby library to send events to Egg}
  gem.description   = %q{This simple Ruby library notifies Egg of events via an HTTP POST.}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'json'
end
