class ApplicationController < ActionController::Base
  include AuthHelper
  helper_method :signed_in?, :current_user

  before_filter :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    default_url_options[:locale] = params[:locale]
  end
end
