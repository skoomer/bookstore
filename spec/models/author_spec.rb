# frozen_string_literal: true

RSpec.describe Author do
  describe 'associations' do
    it { is_expected.to have_many(:books).class_name(Book) }
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(Constants::MAXIMUM_NAME_LENGTH) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(Constants::MAXIMUM_NAME_LENGTH) }
    it { is_expected.to allow_value(FFaker::String.from_regexp(Constants::NAME_FORMAT)).for(:first_name) }
    it { is_expected.to allow_value(FFaker::String.from_regexp(Constants::NAME_FORMAT)).for(:last_name) }
  end
end
