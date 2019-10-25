require "test_helper"

describe Category do
  describe "validations" do
    it "can be valid" do
      is_valid = categories(:valid_category).valid?

      assert( is_valid )
    end

    it "is invalid if there is no name" do
      invalid_category = categories(:valid_category)
      invalid_category.name = ""

      is_valid = invalid_category.valid?

      refute( is_valid )
    end

    it "gives an error message if the name given is not unique" do
      invalid_category = categories(:valid_category2)
      invalid_category.name = "ExpensiveItems"

      is_valid = invalid_category.valid?

      refute( is_valid )
    end
  end
end
