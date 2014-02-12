Gem::Specification.new do |s|
  s.name = %q{kitchen-cabinet}
  s.version = '1.0.1.oh'
  s.date = %q{2014-01-08}
  s.summary = 'Initializes a chef cookbook repo with relevant tools'
  s.description = <<EOF
`kitchen-cabinet` will create an opinionated chef cookbook skeleton complete with testing suite including:
    berkshelf, chefspec, test kitchen, strainer, foodcritic, rubocop, serverspec, stove, and guard. This is a refactor of the meez plugin with some extra additions.

EOF
  s.files = [
    'lib/kitchen-cabinet/cabinet.rb',
    'lib/kitchen-cabinet/templates/.gitignore.eruby',
    'lib/kitchen-cabinet/templates/.kitchen.yml.eruby',
    'lib/kitchen-cabinet/templates/.rubocop.yml.eruby',
    'lib/kitchen-cabinet/templates/Berksfile.eruby',
    'lib/kitchen-cabinet/templates/Gemfile.eruby',
    'lib/kitchen-cabinet/templates/Guardfile.eruby',
    'lib/kitchen-cabinet/templates/Strainerfile.eruby',
    'lib/kitchen-cabinet/templates/chefignore.eruby',
    'lib/kitchen-cabinet/serverspec/default_spec.rb.eruby',
    'lib/kitchen-cabinet/serverspec/spec_helper.rb.eruby',
    'lib/kitchen-cabinet/chefspec/default_spec.rb.eruby',
    'lib/kitchen-cabinet/chefspec/spec_helper.rb.eruby'
  ]
  s.executables = [
    'cabinet'
  ]
  s.authors = ['Taylor Price']
  s.email   = 'tprice@onehealth.com'
  s.homepage = ''
  s.license = 'apache2'
  s.require_paths = ['lib']
  s.add_dependency 'chef', '~> 11.8.0'
  s.add_dependency 'test-kitchen', '~> 1.1.1'
  s.add_dependency 'bundler', '~> 1.5.1'
  s.add_dependency 'berkshelf', '~> 2.0.12'
  s.add_dependency 'git', '~> 1.2.6'
  s.add_dependency 'erubis', '~> 2.7.0'
end
