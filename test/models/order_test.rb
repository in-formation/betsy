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

    it "is invalid if an email is not present" do
      order = orders(:order1)
      order.email = ""

      is_valid = order.valid?
      
      refute(is_valid)
    end

    it "is invalid if the email address is not inputted correctly" do
      order = orders(:order1)
      order.email = "notvalid@1234.cmmmm"

      is_valid = order.valid?

      refute(is_valid)

      order.email = "2fadfdsf.com"
      is_valid = order.valid?

      refute(is_valid)
    end

    it "is invalid if an address is not present" do
      order = orders(:order1)
      order.address = ""

      is_valid = order.valid?

      refute(is_valid)
    end

    it "is invalid if an zip code is not present" do
      order = orders(:order1)
      order.zip = ""

      is_valid = order.valid?

      refute(is_valid)
    end

    it "is invalid if a zip code is not a 5 digit number" do
      order = orders(:order1)
      order.zip = "abcdeqfg"

      is_valid = order.valid?

      refute(is_valid)

      order.zip = 1234567900
      is_valid = order.valid?

      refute(is_valid)
    end

    it "is invalid if the credit card number is not present" do
      order = orders(:order1)
      order.ccnum = ""

      is_valid = order.valid?

      refute(is_valid)
    end

    it "is invalid if the credit card number is not a 16 digit number" do
      order = orders(:order1)
      order.ccnum = "avfjksdlfjas;f"
      is_valid = order.valid?
      refute(is_valid)

      order.ccnum = 12345
      is_valid = order.valid?
      refute(is_valid)
    end

    it "is invalid if the expdate is not present" do
      order = orders(:order1)
      order.expdate = ""

      is_valid = order.valid?
      refute(is_valid)
    end

    it "is invalid if the expdate is not a 5 character string with four numbers seperated by a backslash in the middle" do
      order = orders(:order1)
      order.expdate = "as/dfd"

      is_valid = order.valid?
      refute(is_valid)

      order.expdate = "132/123"

      is_valid = order.valid?
      refute(is_valid)
    end

    it "is invalid if the CCV is not present" do
      order = orders(:order1)
      order.ccv = ""

      is_valid = order.valid?
      refute(is_valid)
    end

    it "is invalid if the CCV is not a three digit number" do
      order = orders(:order1)
      order.ccv = 123456

      is_valid = order.valid?
      refute(is_valid)

      order.ccv = "abc"

      is_valid = order.valid?
      refute(is_valid)
    end

    it "is invalid if the status is not present" do
      order = orders(:order1)
      order.status = ""

      is_valid = order.valid?
      refute(is_valid)
    end
  end
end
