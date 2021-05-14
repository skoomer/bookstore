# frozen_string_literal: true

RSpec.describe Book do
  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name(Author) }
    it { is_expected.to belong_to(:category) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
