require 'test_helper'

class SupplementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supplements_index_url
    assert_response :success
  end

  test "should get new" do
    get supplements_new_url
    assert_response :success
  end

  test "should get edit" do
    get supplements_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get supplements_destroy_url
    assert_response :success
  end

end
