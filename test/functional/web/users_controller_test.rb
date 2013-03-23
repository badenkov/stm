require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    attrs = {
      email: 'test@test.ru',
      password: '123',
      password_confirmation: '123'
    }

    post :create, user: attrs
    assert_response :redirect
    user = User.find_by_email(attrs[:email])
    assert user
  end

end
