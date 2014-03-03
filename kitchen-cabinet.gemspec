Gem::Specification.new do |s|
  s.name = "kitchen-cabinet"
  s.version = '2.1.0'
  s.date = Time.now.strftime("%Y-%m-%d")
  s.homepage = 'https://github.com/onehealth/kitchen-cabinet'
  s.summary = 'Initializes a chef cookbook repo with relevant tools'
  s.description = <<EOF
`kitchen-cabinet` will create a chef cookbook skeleton complete with testing suite including:
    berkshelf, chefspec, test kitchen, strainer, foodcritic, rubocop, serverspec, stove, and guard. It also creates a gemfile suitable for use in CI.

EOF
  s.authors = ['Taylor Price']
  s.email   = 'tprice@onehealth.com'
  s.license = 'apachev2'

  s.required_ruby_version = '>= 1.9.3'
  s.require_paths = ['lib']
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})
  s.files = `git ls-files`.split($/)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  
  s.add_runtime_dependency 'test-kitchen', '~> 1.1', '>= 1.1.1'
  s.add_runtime_dependency 'bundler', '~> 1.5', '>= 1.5.1'
  s.add_runtime_dependency 'berkshelf', '~> 2.0', '>= 2.0.12'
  s.add_runtime_dependency 'git', '~> 1.2', '>= 1.2.6'
  s.add_runtime_dependency 'erubis', '~> 2.7', '>= 2.7.0'
  s.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.1'
  s.add_development_dependency 'rake', '~> 10.1', '>= 10.1.1'
end
