# frozen_string_literal: true

RSpec.describe Author do
  let(:valid_text_value) { FFaker::String.from_regexp(Constants::NAME_FORMAT) }
  let(:valid_text_lenght) { Constants::MAXIMUM_NAME_LENGTH }

  describe 'associations' do
    it { is_expected.to have_many(:books).class_name(Book) }
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(valid_text_lenght) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(valid_text_lenght) }
    it { is_expected.to allow_value(valid_text_value).for(:first_name) }
    it { is_expected.to allow_value(valid_text_value).for(:last_name) }
  end
end
