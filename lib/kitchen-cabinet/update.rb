#!/usr/bin/env ruby
# Encoding: utf-8

# The Update class helps you maintain the versions and config of your cookbook creation tools
class Update
  def self.update_cookbook(cookbook_name, options, path)
    @template = %w(chefignore Gemfile Guardfile Strainerfile .rubocop.yml)
    @template.each do |template|
      tname = File.read(File.join(File.dirname(File.expand_path(__FILE__)), "templates/#{template}.eruby"))
      eruby = Erubis::Eruby.new(tname)
      File.open(File.join(path, "#{template}"), 'w') { |f| f.write(eruby.result(:cookbook_name => cookbook_name)) }
    end
  end
end
