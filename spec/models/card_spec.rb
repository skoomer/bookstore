# frozen_string_literal: true

RSpec.describe Card do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:card_holder) }
    it { is_expected.to validate_presence_of(:valid_thru) }
    it { is_expected.to validate_presence_of(:cvv) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order).dependent(:destroy) }
  end
end
