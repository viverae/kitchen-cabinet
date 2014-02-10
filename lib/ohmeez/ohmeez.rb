class Meez
  require 'fileutils'
  def self.init(cookbook_name, options)
    @tool = {'chef', 'knife', 'git', 'berkshelf', 'kitchen', 'guard', 'chefspec', 'strainer', 'rubocop', 'foodcritic', 'serverspec', 'stove'}
    init_service(tool, cookbook_name, options)
    @template = {'chefignore', '.gitignore', 'Gemfile', 'Berksfile', '.kitchen.yml', 'Guardfile', 'Strainerfile', '.rubocop.yml', 'chefspec', 'serverspec'}
    write_configs(template, cookbook_name, options)
  end

  def self.init_service(tool, cookbook_name, options)
    puts "* Initializing #{tool}"
    path = File.join(options[:path], cookbook_name)
    if @tool = "chef"
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
        contents = "# Encoding: utf-8\n#{File.read(File.join(path, file))}"
        File.open(File.join(path, file), 'w') { |f| f.write(contents) }
      end
    end
    if @tool = "git"
      require 'git'
      Git.init( path, { repository: path } )
    end
    if @tool = "berkshelf"
      require 'berkshelf'
      require 'berkshelf/base_generator'
      require 'berkshelf/init_generator'
      Berkshelf::InitGenerator.new(
        [path],
        {
          skip_test_kitchen: true,
          skip_vagrant: true
        }
      ).invoke_all
    end
    if @tool = "kitchen"
      require 'kitchen'
      require 'kitchen/generator/init'
      Kitchen::Generator::Init.new([], {}, destination_root: path).invoke_all
    end
    if @tool = "chefspec"
      spec_path = File.join(path, 'spec')
      FileUtils.mkdir_p(spec_path)
    end
    if @tool = "serverspec"
      spec_path = File.join(path, 'test', 'integration', 'default', 'serverspec')
      FileUtils.mkdir_p(spec_path)
    end
  end
  
  def self.write_configs(template, cookbook_name, options)
    path = File.join(options[:path], cookbook_name)
    @template.each do |template|
      @spec = {'spec_helper.rb', 'default_spec.rb'}
      if @template = "chefspec"
        spec_path = File.join(path, 'spec')
        erb "chefspec/#{spec}.erb" > "#{spec_path}/#{spec}"
      elsif @template = "serverspec"
        spec_path = File.join(path, 'spec')
        erb "serverspec/#{spec}.erb" > "#{spec_path}/#{spec}"
      end
      erb "templates/#{template}.erb" > "#{path}/#{template}"
    end
     # for both chefspec and serverspec - 'spec_helper.rb', 'default_spec.rb'
end