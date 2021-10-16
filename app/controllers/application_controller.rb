class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_theme
  around_action :switch_locale
  protect_from_forgery with: :null_session

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      cookies[:theme] = theme
      redirect_to(request.referrer || root_path)
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def after_sign_in_path_for(_resource)
    root_path(locale: I18n.locale)
  end

  private

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
