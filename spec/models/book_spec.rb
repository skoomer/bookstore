# frozen_string_literal: true

RSpec.describe Book do
  let(:valid_text_value) { FFaker::String.from_regexp(Constants::NAME_FORMAT) }
  let(:valid_text_lenght) { Constants::MAXIMUM_NAME_LENGTH }

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name(Author) }
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:publication_year) }
    it { is_expected.to validate_length_of(:title).is_at_most(valid_text_lenght) }
    it { is_expected.to allow_value(valid_text_value).for(:title) }
  end
end
