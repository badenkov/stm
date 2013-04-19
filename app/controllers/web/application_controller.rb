class Web::ApplicationController < ApplicationController
  protect_from_forgery
  include AuthHelper
end
