# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_FORMAT_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\S]{8,}\z/

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :omniauthable,
          omniauth_providers: %i[facebook]

  validates :password,
            format: { with: PASSWORD_FORMAT_REGEX },
            on: :update

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.uid = auth.uid
      user.provider = auth.provider
    end
  end
end
