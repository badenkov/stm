require 'test_helper'

class Api::StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user

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

  test "should create story" do
    attrs = attributes_for :story
    attrs[:title] = nil

    post :create, story: attrs

    puts @response.code
    puts @response.body.inspect
    #assert_response :created
  end

  test "should update story" do
    attrs = attributes_for :story

    #put :update, id: @story, story: attrs
    put :update, id: 9, story: attrs

    assert_response :not_found
    puts @response.code
    puts @response.body.inspect
  end

  test "shoult destroy story" do
    delete :destroy, id: @story

    assert_response :no_content
    assert !Story.exists?(@story)
  end
end
