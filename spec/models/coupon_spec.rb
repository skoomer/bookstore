# frozen_string_literal: true

RSpec.describe Coupon do
  describe 'associations' do
    it { is_expected.to belong_to(:order).without_validating_presence }
  end

  describe '.scope' do
    it '#active' do
      expect(described_class.active).to eq described_class.where(active: true)
    end

    it '#not_active' do
      expect(described_class.not_active).to eq described_class.where(active: false)
    end
  end
end
