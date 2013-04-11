require 'test_helper'

class Api::StoriesControllerTest < ActionController::TestCase
  setup do
    @story = create :story
  end

  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "should show story" do
    get :show, format: :json, id: @story

    assert_response :success
  end
end
