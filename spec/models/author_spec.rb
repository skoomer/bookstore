# frozen_string_literal: true

RSpec.describe Author do
  describe 'associations' do
    it { is_expected.to have_many(:books).class_name(Book) }
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:first_name) }
  end
end
