require "test_helper"

describe CategoriesController do
  describe "index action" do
    it "gives back a successful response" do
      get categories_path

      must_respond_with :success
    end
  end

  describe 'show action' do
    it 'responds with a success when id given exists' do

      get category_path(categories(:valid_category).id)

      must_respond_with :success

    end

    it 'responds with a not_found when id given does not exist' do

      get category_path("-500")

      must_respond_with :not_found
    end
  end
  
  describe "create" do
    it 'creates a new category successfully and redirects the user to the category page' do
      category_hash = {
        category: {
          name: "New Category"
        }
      }

      expect {
        post categories_path, params: category_hash
      }.must_differ 'Category.count', 1

      must_redirect_to category_path(Category.find_by(name: "New Category"))
    end
  end
end
