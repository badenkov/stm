require 'test_helper'

class Web::Stories::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user

    @story = create :story
    @comment = create :comment
    @story.comments << @comment

    set_http_referer
  end

  test "should get edit" do
    get :edit, story_id: @story, id: @comment

    assert_response :success
  end
  
  test "should create comment" do
    attrs = attributes_for :comment

    assert_difference('Comment.count') do
      post :create, story_id: @story, comment: attrs
    end
    assert_response :redirect
  end

  test "should update comment" do
    attrs = attributes_for :comment

    put :update, story_id: @story, id: @comment, comment: attrs

    assert_response :redirect, "redirect"

    comment = Comment.find @comment.id
    assert comment.body == attrs[:body]
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, story_id: @story, id: @comment
    end

    assert_response :redirect
  end
end
