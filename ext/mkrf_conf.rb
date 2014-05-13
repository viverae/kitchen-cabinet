require 'rubygems'
require 'rubygems/command.rb'
require 'rubygems/dependency_installer.rb'

Gem::Command.build_args = ARGV

inst = Gem::DependencyInstaller.new
if File.exist?('/opt/chefdk')
  %w(chefspec serverspec guard guard-rubocop guard-foodcritic guard-kitchen guard-rspec rspec).each do |gems|
    `chef gem install #{gems} --no-ri --no-rdoc`
  end

elsif File.exist?('/opt/chef')
  puts 'Consider switching to chefdk or the gem version of chef.'
  puts 'Some functionality of kitchen-cabinet may not be unavailable with your current setup.'
  %w(foodcritic rubocop test-kitchen kitchen-vagrant chefspec serverspec guard guard-rubocop guard-foodcritic guard-kitchen guard-rspec rspec).each do |gems|
    `sudo /opt/chef/embedded/bin/gem install #{gems} --no-ri --no-rdoc`
  end
else
  inst.install 'chef', '~> 11.12.2'
  inst.install 'chefspec', '~> 0.0.0'
end

# create dummy rakefile to indicate success
f = File.open(File.join(File.dirname(__FILE__), 'Rakefile'), 'w')
f.write("task :default\n")
f.close
