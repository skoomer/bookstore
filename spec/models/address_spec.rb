# frozen_string_literal: true

RSpec.describe Address do
  let(:address) { create(:address, country: 'UA') }
  let(:valid_text_value) { FFaker::String.from_regexp(Constants::NAME_FORMAT) }
  let(:valid_text_lenght) { Address::MAXIMUM_TEXT_LENGTH }
  let(:valid_lenght_phone_number) { Address::MAXIMUM_PHONE_LENGTH }
  let(:valid_lenght_zip) { Address::MAXIMUM_ZIP_LENGTH }
  let(:valid_text_value_zip) { FFaker::AddressUA.zip_code }
  let(:valid_text_value_phone) { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub!(/\s/, '').delete('-') }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'length validations' do
    it { is_expected.to validate_length_of(:first_name).is_at_most(valid_text_lenght) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(valid_text_lenght) }
    it { is_expected.to validate_length_of(:city).is_at_most(valid_text_lenght) }
    it { is_expected.to validate_length_of(:country).is_at_most(valid_text_lenght) }
    it { is_expected.to validate_length_of(:address).is_at_most(valid_text_lenght) }
    it { is_expected.to validate_length_of(:zip).is_at_most(valid_lenght_zip) }
    it { is_expected.to validate_length_of(:phone_number).is_at_most(valid_lenght_phone_number) }
  end

  describe 'format validations' do
    it { is_expected.to allow_value(valid_text_value).for(:first_name) }
    it { is_expected.to allow_value(valid_text_value).for(:last_name) }
    it { is_expected.to allow_value(valid_text_value).for(:city) }
    it { is_expected.to allow_value(valid_text_value).for(:country) }
    it { is_expected.to allow_value(valid_text_value).for(:address) }
    it { is_expected.to allow_value(valid_text_value_zip).for(:zip) }
    it { is_expected.to allow_value(valid_text_value_phone).for(:phone_number) }
  end

  describe '#country_name' do
    it 'returns country name' do
      expect(address.country_name).to eq(ISO3166::Country[address.country])
    end
  end
end
