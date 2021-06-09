# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_FORMAT_REGEX = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[facebook]

  validate :password_regex

  has_one  :shipping_address, dependent: :destroy
  has_one  :billing_address, dependent: :destroy

  accepts_nested_attributes_for :shipping_address
  accepts_nested_attributes_for :billing_address

  belongs_to :shipping_address, class_name: 'Address', optional: true, autosave: true
  belongs_to :billing_address, class_name: 'Address', optional: true, autosave: true

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.uid = auth.uid
      user.provider = auth.provider
    end
  end

  private

  def password_regex
    return if password.blank? || password =~ PASSWORD_FORMAT_REGEX

    errors.add :password, I18n.t('users.passwords.messages.uncorrect_password')
  end
end
