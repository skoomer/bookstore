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
          :omniauthable,
          omniauth_providers: %i[facebook]

  validates :password,
            format: { with: PASSWORD_FORMAT_REGEX },
            on: :create

  belongs_to :shipping_address, class_name: 'Address', optional: true, autosave: true
  belongs_to :billing_address, class_name: 'Address', optional: true, autosave: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # user.provider = auth.provider
      user.uid = auth.uid
    end
  end
end
