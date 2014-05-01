require 'rubygems'
require 'rubygems/command.rb'
require 'rubygems/dependency_installer.rb'

Gem::Command.build_args = ARGV

inst = Gem::DependencyInstaller.new
if File.exist?('/opt/chefdk')
elsif File.exist?('opt/chef')
else
  inst.install 'chef', '~> 11.12.2'
end

# create dummy rakefile to indicate success
f = File.open(File.join(File.dirname(__FILE__), 'Rakefile'), 'w')
f.write("task :default\n")
f.close
