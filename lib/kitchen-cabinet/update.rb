#!/usr/bin/env ruby
# Encoding: utf-8

# The Update class helps you maintain the versions and config of your cookbook creation tools
class Update
  def self.update_cookbook(cookbook_name, cookbook_path)
    require 'kitchen-cabinet/config'
    puts "Updating #{cookbook_name}..."
    %w(chefignore Gemfile Guardfile Thorfile .rubocop.yml).each do |template|
      Initconfig.write_config(cookbook_name, cookbook_path, template)
      puts "#{template} is up to date!"
    end
  end
end
