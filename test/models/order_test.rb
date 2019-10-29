require "test_helper"

describe Order do
  describe "validations" do
    it "should be a valid order" do
      is_valid = orders(:order1).valid?

      assert(is_valid)
    end
  end
end
