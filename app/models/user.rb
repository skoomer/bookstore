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
          :omniauthable,
          omniauth_providers: %i[facebook]

  validates :password,
            format: { with: PASSWORD_FORMAT_REGEX },
            on: :create

  belongs_to :shipping_address, class_name: 'Address', optional: true, autosave: true
  belongs_to :billing_address, class_name: 'Address', optional: true, autosave: true

  def self.from_omniauth(auth)
    User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
