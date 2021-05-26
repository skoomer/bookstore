
# frozen_string_literal: true

RSpec.describe Address do
  let(:address) { create(:address, country: 'UA') }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

  describe '#country_name' do
    it 'return country name' do
      expect(address.country_name).to eq(ISO3166::Country[address.country])
    end
  end
end