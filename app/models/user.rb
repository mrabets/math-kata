class User < ApplicationRecord
  # validates :email, :password, presence: true

  has_many :tasks
  has_many :solved_tasks
  has_many :ratings
  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.github'] && session['devise.github_data']['extra']['raw_info'] && user.email.blank?
        user.email = data['email']
      end
      if data = session['devise.google_oauth2'] && session['devise.google_oauth2_data']['extra']['raw_info'] && user.email.blank?
        user.email = data['email']
      end
    end
  end
end
