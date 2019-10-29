require "test_helper"

describe Order do
  describe "validations" do
    it "should be a valid order" do
      is_valid = orders(:order1).valid?

      assert(is_valid)
    end

    it "is invalid if a name is not present" do
      order = orders(:order1)
      order.name = ""

      is_valid = order.valid?

      refute(is_valid)
    end

  end
end
