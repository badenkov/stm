require 'test_helper'

class Web::StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user

    @story = create :story
    @user.requested_stories << @story
  end

  test "should get index" do
    get :index

    assert_response :success
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should show story" do
    get :show, id: @story

    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story

    assert_response :success
  end

  test "should create story" do
    attrs = attributes_for :story

    post :create, story: attrs

    assert_response :redirect
  end

  test "should update story" do
    attrs = attributes_for :story
    put :update, id: @story, story: attrs

    assert_response :redirect

    story = Story.find(@story.id)
    assert story.title == attrs[:title]
  end

  test "should destroy story" do
    delete :destroy, id: @story

    assert_response :redirect
    assert !Story.exists?(@story)
  end
end
