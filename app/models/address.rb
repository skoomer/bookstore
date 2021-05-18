
# frozen_string_literal: true

class Address < ApplicationRecord
  MAXIMUM_TEXT_LENGTH = 50
  MAXIMUM_ZIP_LENGTH = 10
  MAXIMUM_PHONE_LENGTH = 15
  ADDRESS_FORMAT = /[a-zA-Z]+(,)*(-)*( )*/
  PHONE_NUMBER_FORMAT = /\A^(\+)[0-9]{1,15}/

  validates :first_name, :last_name, :address, :country, :city, :zip, :phone_number, presence: true
  validates :first_name, :last_name, :address, :country, :city, length: { maximum: MAXIMUM_TEXT_LENGTH }
  validates :zip, length: { maximum: MAXIMUM_ZIP_LENGTH }
  validates :phone_number, length: { maximum: MAXIMUM_PHONE_LENGTH }
  validates :address, format: { with: ADDRESS_FORMAT }
  validates :phone_number, format: { with: PHONE_NUMBER_FORMAT }

  belongs_to :user

  def country_name
    code_country = ISO3166::Country[country]
    code_country || code_country.name
  end


end
