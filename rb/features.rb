# Maplestory SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module MaplestoryFeatures
  def self.make_feature(name)
    case name
    when "base"
      MaplestoryBaseFeature.new
    when "test"
      MaplestoryTestFeature.new
    else
      MaplestoryBaseFeature.new
    end
  end
end
