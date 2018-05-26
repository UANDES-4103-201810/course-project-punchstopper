require 'test_helper'

class UserWishlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_wishlist = user_wishlists(:one)
  end

  test "should get index" do
    get user_wishlists_url
    assert_response :success
  end

  test "should get new" do
    get new_user_wishlist_url
    assert_response :success
  end

  test "should create user_wishlist" do
    assert_difference('UserWishlist.count') do
      post user_wishlists_url, params: { user_wishlist: { project_id: @user_wishlist.project_id, user_id: @user_wishlist.user_id } }
    end

    assert_redirected_to user_wishlist_url(UserWishlist.last)
  end

  test "should show user_wishlist" do
    get user_wishlist_url(@user_wishlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_wishlist_url(@user_wishlist)
    assert_response :success
  end

  test "should update user_wishlist" do
    patch user_wishlist_url(@user_wishlist), params: { user_wishlist: { project_id: @user_wishlist.project_id, user_id: @user_wishlist.user_id } }
    assert_redirected_to user_wishlist_url(@user_wishlist)
  end

  test "should destroy user_wishlist" do
    assert_difference('UserWishlist.count', -1) do
      delete user_wishlist_url(@user_wishlist)
    end

    assert_redirected_to user_wishlists_url
  end
end
