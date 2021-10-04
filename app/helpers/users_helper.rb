module UsersHelper
  def get_social_media(provider)
    case provider
    when 'facebook'
      return facebook
    when 'google_oauth2'
      return 'google'
    end 
  end
end
