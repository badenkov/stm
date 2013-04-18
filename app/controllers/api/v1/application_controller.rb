class Api::V1::ApplicationController < Api::ApplicationController
  before_filter :authenticate

  respond_to :json

  private

  def authenticate

    if signed_in?
      return
    end

    user = authenticate_with_http_basic do |login, password|
      user = User.where(email: login).first
      if user && user.try(:authenticate, password)
        sign_in user
        user
      else
        false
      end
    end

    unless user
      request_http_basic_authentication
    end
  end
end
