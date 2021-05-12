# frozen_string_literal: true

RSpec.describe Author do
  let(:author) { create(:author) }

  describe 'with associations' do
    it { is_expected.to have_many(:books).class_name(Book) }
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe '#validate author' do
    it '.presence first_name' do
      expect(author).to validate_presence_of(:first_name)
    end
  end
end
