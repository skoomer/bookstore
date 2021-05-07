# frozen_string_literal: true

RSpec.describe Category do
  let(:category) { create(:category) }

  describe 'with associations' do
    it { is_expected.to have_many(:books).class_name(Book) }
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe '#validate category' do
    it '.presence title' do
      expect(category).to validate_presence_of(:title)
    end
  end
end
