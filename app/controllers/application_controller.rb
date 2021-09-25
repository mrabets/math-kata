class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale

  def after_sign_in_path_for(resource)
    root_path
  end

	private

	def set_locale
	  I18n.locale = extract_locale || I18n.default_locale
	end
	
	def extract_locale
	  parsed_locale = params[:locale]
	  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
	end
end
