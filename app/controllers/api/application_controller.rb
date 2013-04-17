class Api::ApplicationController < ApplicationController
  #before_filter :authenticate, :authorize
  before_filter :ttt

  respond_to :json

  private

  def ttt

    puts "Authenticate with http basic"

    user = authenticate_with_http_basic do |login, password|
      puts login, password
      user = User.where(email: login).first
      if user && user.try(:authenticate, password)
        puts 'Authenticate'
        sign_in user
        user
      else
        false
      end
    end

    puts user.inspect

    if user
      puts "return true"
    else
      puts "return false"
      request_http_basic_authentication
    end
  end

  def authenticate
    user = authenticate_with_http_basic do |login, password|
      false
    end

    #unless signed_in?
      #authenticate_or_request_with_http_basic do |login, password|
        #puts login, password
        #user = User.where(email: login).first
        #if user && user.try(:authenticate, password)
          #sign_in user
        #end
      #end
    #end
  end

  def authorize
    unless signed_in?
      render head: :forbidden
    end
  end
end
