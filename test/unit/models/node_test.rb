require File.join(File.dirname(__FILE__), '/../../test_helper')

class NodeTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert Node.create!
  end
  
end