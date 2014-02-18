#!/usr/bin/env ruby
# Encoding: utf-8

# The Update class helps you maintain the versions and config of your cookbook creation tools
class Update
  def self.update_cookbook(cookbook_name, options, cookbook_path)
    @template = %w(chefignore Gemfile Guardfile Rakefile .rubocop.yml)
    require 'kitchen-cabinet/config'
    puts "Updating #{cookbook_name}..."
    @template.each do |template|
      Initconfig.write_config(cookbook_name, options, cookbook_path, template)
      puts "#{template} is up to date!"
    end
  end
end
