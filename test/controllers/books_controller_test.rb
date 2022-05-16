require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "index action should be success" do
    get :index
    assert_response :success
  end
end
