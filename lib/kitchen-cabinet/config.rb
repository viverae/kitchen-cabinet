# Writes configs for cabinet and update.
class Config
  def self.write_config(cookbook_name, options, path, template)
    tname = File.read(File.join(File.dirname(File.expand_path(__FILE__)), "templates/#{template}.eruby"))
    eruby = Erubis::Eruby.new(tname)
    File.open(File.join(path, "#{template}"), 'w') { |f| f.write(eruby.result(:cookbook_name => cookbook_name)) }
  end
end
