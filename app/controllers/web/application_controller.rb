class Web::ApplicationController < ApplicationController
  include AuthHelper

  protect_from_forgery
end
