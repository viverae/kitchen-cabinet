# cabinet_spec.rb
require File.expand_path('../../lib/kitchen-cabinet/cabinet.rb', __FILE__)
describe Cabinet do
  options = {}
  options[:path] = 'test-path'
  options[:copywrite] = 'test-copywrite'
  options[:license] = 'test-license'
  options[:email] = 'test-email'
  options[:help] = 'test-help'
  describe '#self.init_service' do
    it 'Initialize all our services' do
      puts 'init pass'
    end
  end

  describe '#self.write_configs' do
    it 'writes configs' do
      puts 'config pass'
    end
  end
end
