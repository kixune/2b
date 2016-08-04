require 'test_helper'

class ChestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chests_index_url
    assert_response :success
  end

  test "should get new" do
    get chests_new_url
    assert_response :success
  end

  test "should get show" do
    get chests_show_url
    assert_response :success
  end

  test "should get edit" do
    get chests_edit_url
    assert_response :success
  end

end
