#!/usr/bin/env ruby
# Encoding: utf-8

# The Update class helps you maintain the versions and config of your cookbook creation tools
class Update
  def self.update_cookbook(cookbook_name, options, path)
    @template = %w(chefignore Gemfile Guardfile Strainerfile .rubocop.yml)
    require 'kitchen-cabinet/config'
    @template.each do |template|
      Config.write_config(cookbook_name, options, path, template)
    end
  end
end
