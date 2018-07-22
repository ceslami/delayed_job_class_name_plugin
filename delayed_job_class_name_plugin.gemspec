# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed/class_name/version'

Gem::Specification.new do |spec|
  spec.name          = 'delayed_job_class_name_plugin'
  spec.version       = Delayed::ClassName::VERSION
  spec.authors       = ['Cyrus Eslami']
  spec.email         = ['ceslami@gmail.com']

  spec.summary       = 'Delayed::Job plugin to record the class name of the enqueued payload object'
  spec.homepage      = 'https://github.com/ceslami/delayed_job_class_name_plugin'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = Dir.glob('spec/**/*')
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_dependency 'delayed_job', '~> 4.1', '>= 4.1.0'
  spec.add_dependency 'delayed_job_active_record', '~> 4.1', '>= 4.1.0'

  spec.add_development_dependency 'rake', '< 11.0'
  spec.add_development_dependency 'rspec', '3.3.0'
end
