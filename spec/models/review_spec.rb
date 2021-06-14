# frozen_string_literal: true

RSpec.describe Review do
  describe 'associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to belong_to(:book) }
  end

  describe 'status values' do
    it { expect(described_class.statuses[:waiting]).to eq(0) }
    it { expect(described_class.statuses[:approved]).to eq(1) }
    it { expect(described_class.statuses[:rejected]).to eq(2) }
  end

  describe 'scopes' do
    it 'approved' do
      expect(described_class.approved).to eq described_class.where(status: 1)
    end
  end

  describe 'aasm' do
    it { is_expected.to transition_from(:waiting).to(:approved).on_event(:approved, :rejected) }
    it { is_expected.to transition_from(:approved).to(:rejected).on_event(:rejected) }
  end
end
