# frozen_string_literal: true

RSpec.describe OrderItem do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:order) }
  end

  describe '.scope' do
    it '#by_created' do
      expect(described_class.by_created).to eq described_class.order(created_at: :desc)
    end
  end
end
