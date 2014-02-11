Gem::Specification.new do |s|
  s.name = %q{ohmeez}
  s.version = '0.0.1.oh'
  s.date = %q{2014-01-08}
  s.summary = 'Initializes a chef cookbook with TDD framework'
  s.description = <<EOF
`Meez` (slang for `mise en place`) will create an opinionated chef cookbook skeleton complete with testing suite including:
    berkshelf, chefspec, test kitchen, strainer, foodcritic, server spec - Customized for OH

EOF
  s.files = [
    'lib/ohmeez/ohmeez.rb',
    'lib/ohmeez/templates/.gitignore.erb',
    'lib/ohmeez/templates/.kitchen.yml.erb',
    'lib/ohmeez/templates/.rubocop.yml.erb',
    'lib/ohmeez/templates/Berksfile.erb',
    'lib/ohmeez/templates/Gemfile.erb',
    'lib/ohmeez/templates/Guardfile.erb',
    'lib/ohmeez/templates/Strainerfile.erb',
    'lib/ohmeez/templates/chefignore.erb',
    'lib/ohmeez/serverspec/default_spec.rb.erb',
    'lib/ohmeez/serverspec/spec_helper.rb.erb',
    'lib/ohmeez/chefspec/default_spec.rb.erb',
    'lib/ohmeez/chefspec/spec_helper.rb.erb'
  ]
  s.executables = [
    'ohmeez'
  ]
  s.authors = ['Taylor Price']
  s.email   = 'tprice@onehealth.com'
  s.homepage = 'http://github.com/paulczar/meez'
  s.license = 'apache2'
  s.require_paths = ['lib']
  s.add_dependency 'chef', '~> 11.8.0'
  s.add_dependency 'test-kitchen', '~> 1.1.1'
  s.add_dependency 'bundler', '~> 1.5.1'
  s.add_dependency 'berkshelf', '~> 2.0.12'
  s.add_dependency 'git', '~> 1.2.6'
end
