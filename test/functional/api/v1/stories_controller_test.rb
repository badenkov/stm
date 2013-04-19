require 'test_helper'

class Api::V1::StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user

    @story = create :story
    @user.requested_stories << @story
  end

  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "should show story" do
    get :show, format: :json, id: @story

    assert_response :success
  end

  test "should create story" do
    attrs = attributes_for :story

    post :create, format: :json, story: attrs

    assert_response :created
  end

  test "should update story" do
    attrs = attributes_for :story

    put :update, format: :json, id: @story, story: attrs

    assert_response :success

    story = Story.find(@story.id)
    assert_equal story.title, attrs[:title]
  end

  test "should destroy story" do
    delete :destroy, format: :json, id: @story

    assert_response :no_content
    refute Story.exists?(@story)
  end
end
