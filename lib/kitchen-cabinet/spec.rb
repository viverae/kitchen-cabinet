#!/usr/bin/env ruby
# Encoding: utf-8

# Removes duplication of code between chefspec and serverspec installs.
class Spec
  def self.install_specs(tool, cookbook_path, cookbook_name)
    if tool == 'chefspec'
      spec_path = File.join(cookbook_path, 'spec')
    elsif tool == 'serverspec'
      spec_path = File.join(cookbook_path, 'test', 'integration', 'default', 'serverspec')
    end
    puts "* Initializing #{tool}"
    %w(spec_helper.rb default_spec.rb).each do |spec|
      FileUtils.mkdir_p(spec_path)
      tname = File.read(File.join(File.dirname(File.expand_path(__FILE__)), "templates/#{tool}/#{spec}.eruby"))
      eruby = Erubis::Eruby.new(tname)
      File.open(File.join(spec_path, "#{spec}"), 'w') { |f| f.write(eruby.result(:cookbook_name => cookbook_name)) }
    end
  end
end
