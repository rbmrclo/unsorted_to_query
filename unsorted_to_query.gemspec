lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unsorted_to_query/version'

Gem::Specification.new do |gem|
  gem.name        = 'unsorted_to_query'
  gem.version     = UnsortedToQuery::VERSION
  gem.summary     = 'Use `.to_query` without sorting'
  gem.description = 'A Rails patch for ActiveSupport::CoreExtensions::Hash#to_query which removes the call for `sort!`'

  gem.license  = 'MIT'
  gem.authors  = ['Robbie Marcelo']
  gem.email    = ['rbmrclo@hotmail.com']
  gem.homepage = 'https://github.com/rbmrclo/unsorted_to_query'

  gem.files = `git ls-files -z`.split("\x0")

  gem.require_paths = ['lib']

  gem.test_files = gem.files.grep(%r{^(test)/})

  gem.required_ruby_version = '>= 2.0.0'

  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'bundler', '~> 1.9'

  gem.add_dependency 'activesupport', ['>= 3.0.0']
end
