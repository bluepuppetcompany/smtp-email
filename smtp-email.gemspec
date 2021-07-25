# -*- encoding: utf-8 -*-
Gem::Specification.new do |spec|
  spec.name = 'smtp-email'
  spec.version = '0.0.0'
  spec.summary = 'SMTP Email'
  spec.description = ' '

  spec.authors = ['Joseph Choe']
  spec.email = ['joseph@josephchoe.com']
  spec.homepage = 'https://github.com/bluepuppetcompany/smtp-email'

  spec.require_paths = ['lib']
  spec.files = Dir.glob('{lib}/**/*')
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.6'

  spec.add_runtime_dependency 'mail'

  spec.add_runtime_dependency 'evt-log'

  spec.add_development_dependency 'test_bench'
end
