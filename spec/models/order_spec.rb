# frozen_string_literal: true

RSpec.describe Order do
  describe 'associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
  end

  describe 'returns status order' do
    it { expect(described_class.statuses[:in_progress]).to eq(0) }
    it { expect(described_class.statuses[:completed]).to eq(1) }
    it { expect(described_class.statuses[:in_delivery]).to eq(2) }
    it { expect(described_class.statuses[:delivered]).to eq(3) }
    it { expect(described_class.statuses[:canceled]).to eq(4) }
  end

  describe 'returns aasm status' do
    it { is_expected.to transition_from(:in_progress).to(:completed).on_event(:completed, :canceled) }
    it { is_expected.to transition_from(:completed).to(:in_delivery).on_event(:in_delivery, :canceled) }
    it { is_expected.to transition_from(:in_delivery).to(:delivered).on_event(:delivered, :canceled) }
    it { is_expected.to transition_from(:delivered).to(:canceled).on_event(:canceled) }
  end
end
