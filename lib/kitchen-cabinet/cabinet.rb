#!/usr/bin/env ruby
# Encoding: utf-8

# Cabinet helps create and maintain cookbooks
# complete with an opinionated testing suite.
class Cabinet
  require 'fileutils'
  require 'erubis'
  def self.init(cookbook_name, options, path)
    init_chef(cookbook_name, options, path)
    init_git(cookbook_name, options, path)
    init_berkshelf(cookbook_name, options, path)
    init_kitchen(cookbook_name, options, path)
    init_spec(cookbook_name, options, path)
    write_configs(cookbook_name, options, path)
  end

  def self.init_chef(cookbook_name, options, path)
    tool = 'chef'
    puts "* Initializing #{tool}"
    require 'chef/knife/cookbook_create'
    create_cookbook = Chef::Knife::CookbookCreate.new
    create_cookbook.name_args = [cookbook_name]
    create_cookbook.config[:cookbook_path]      = options[:path]
    create_cookbook.config[:cookbook_copyright] = options[:copyright] || 'YOUR_COMPANY_NAME'
    create_cookbook.config[:cookbook_license]   = options[:license]   || 'YOUR_EMAIL'
    create_cookbook.config[:cookbook_email]     = options[:email]     || 'none'
    create_cookbook.run
    %w{ metadata.rb recipes/default.rb }.each do |file|
      puts "\tRewriting #{file}"
      contents = "\# Encoding: utf-8\n#{File.read(File.join(path, file))}"
      File.open(File.join(path, file), 'w') { |f| f.write(contents) }
    end
  end

  def self.init_git(cookbook_name, options, path)
    tool = 'git'
    puts "* Initializing #{tool}"
    require 'git'
    Git.init(path, repository: path)
  end

  def self.init_berkshelf(cookbook_name, options, path)
    tool = 'berkshelf'
    puts "* Initializing #{tool}"
    require 'berkshelf'
    require 'berkshelf/base_generator'
    require 'berkshelf/init_generator'
    Berkshelf::InitGenerator.new(
      [path],
        skip_test_kitchen: true,
        skip_vagrant: true
    ).invoke_all
  end

  def self.init_kitchen(cookbook_name, options, path)
    tool = 'kitchen'
    puts "* Initializing #{tool}"
    require 'kitchen'
    require 'kitchen/generator/init'
    Kitchen::Generator::Init.new([], {}, destination_root: path).invoke_all
  end

  def self.init_spec(cookbook_name, options, path)
    require 'kitchen-cabinet/spec'
    @tool = %w(chefspec serverspec)
    @tool.each do |tool|
      Spec.install_specs(tool, path, cookbook_name)
    end
  end

  def self.write_configs(cookbook_name, options, path)
    @template = %w(chefignore .gitignore Gemfile Berksfile .kitchen.yml Guardfile Strainerfile .rubocop.yml)
    puts 'this is the ' + cookbook_name + ' cookbook.'
    require 'kitchen-cabinet/config'
    @template.each do |template|
      Initconfig.write_config(cookbook_name, options, path, template)
    end
  end
end
