class Ohmeez
  require 'fileutils'
  require 'erubis'
  def self.init(cookbook_name, options)
    init_service(cookbook_name, options)
    write_configs(cookbook_name, options)
  end

  def self.init_service(cookbook_name, options)
    tool = tool
    @tool = ['chef', 'knife', 'git', 'berkshelf', 'kitchen', 'guard', 'chefspec', 'strainer', 'rubocop', 'foodcritic', 'serverspec', 'stove']
    @tool.each do |tool|
      puts "* Initializing #{tool}"
      path = File.join(options[:path], cookbook_name)
      if tool == "chef"
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
      if tool == "git"
        require 'git'
        Git.init( path, { repository: path } )
      end
      if tool == "berkshelf"
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
      if tool == "kitchen"
        require 'kitchen'
        require 'kitchen/generator/init'
        Kitchen::Generator::Init.new([], {}, destination_root: path).invoke_all
      end
      if tool == "chefspec"
        spec_path = File.join(path, 'spec')
        FileUtils.mkdir_p(spec_path)
      end
      if tool == "serverspec"
        spec_path = File.join(path, 'test', 'integration', 'default', 'serverspec')
        FileUtils.mkdir_p(spec_path)
      end
    end
  end
  
  def self.write_configs(cookbook_name, options)
    template = template
    @template = ['chefignore', '.gitignore', 'Gemfile', 'Berksfile', '.kitchen.yml', 'Guardfile', 'Strainerfile', '.rubocop.yml', 'chefspec', 'serverspec']
    path = File.join(options[:path], cookbook_name)
    puts "this is the " + cookbook_name + " cookbook."
    @template.each do |template|
      @spec = ['spec_helper.rb', 'default_spec.rb']
      if template == "chefspec"
        @spec.each do |spec|
          spec_path = File.join(path, 'spec')
          tname = File.read(File.join(File.dirname(File.expand_path(__FILE__)), "chefspec/#{spec}.eruby"))
          eruby = Erubis::Eruby.new(tname)
          File.open(File.join(spec_path, "#{spec}"), 'w') { |f| f.write(eruby.result(:cookbook_name=>cookbook_name)) }
        end
      elsif template == "serverspec"
        @spec.each do |spec|
          spec_path = File.join(path, 'spec')
          tname = File.read(File.join(File.dirname(File.expand_path(__FILE__)), "serverspec/#{spec}.eruby"))
          eruby = Erubis::Eruby.new(tname)
          File.open(File.join(spec_path, "#{spec}"), 'w') { |f| f.write(eruby.result(:cookbook_name=>cookbook_name)) }
        end
      else
        tname = File.read(File.join(File.dirname(File.expand_path(__FILE__)), "templates/#{template}.eruby"))
        eruby = Erubis::Eruby.new(tname)
        File.open(File.join(path, "#{template}"), 'w') { |f| f.write(eruby.result(:cookbook_name=>cookbook_name)) }
      end
    end
  end
end