# cabinet_spec.rb
require "kitchen-cabinet"
describe Cabinet do
  describe "#self.init_service" do
    it "returns 0 when successful" do
      cabinet = Cabinet.new
    end
  end
  
  describe "#self.write_configs" do 
  end
end