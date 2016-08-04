require 'test_helper'

class GemstonesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gemstones_index_url
    assert_response :success
  end

  test "should get new" do
    get gemstones_new_url
    assert_response :success
  end

  test "should get create" do
    get gemstones_create_url
    assert_response :success
  end

  test "should get show" do
    get gemstones_show_url
    assert_response :success
  end

  test "should get edit" do
    get gemstones_edit_url
    assert_response :success
  end

  test "should get update" do
    get gemstones_update_url
    assert_response :success
  end

  test "should get destroy" do
    get gemstones_destroy_url
    assert_response :success
  end

end
