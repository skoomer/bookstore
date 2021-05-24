# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_FORMAT_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\S]{8,}\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable,
          :omniauthable,
          omniauth_providers: %i[facebook]

  validates :password,
            format: { with: PASSWORD_FORMAT_REGEX },
            on: :create
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.uid = auth.uid
    end
  end

  # after_create :send_admin_mail
  # def send_admin_mail
  #   UserMailer.send_new_user_message(self).deliver
  # end
end
