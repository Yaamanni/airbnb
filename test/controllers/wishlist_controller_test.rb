require "test_helper"

class WishlistControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wishlist_new_url
    assert_response :success
  end
end
