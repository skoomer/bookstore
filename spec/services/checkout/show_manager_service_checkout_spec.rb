# frozen_string_literal: true

RSpec.describe Checkout::ShowManagerService do
  subject(:service) { described_class.new(order, user) }

  let(:user) { create(:user, :add_address) }
  let(:order) { create(:order, :add_coupon, user: user) }

  describe 'address step' do
    it { expect(service.call(:address)).to eq true }
  end

  describe 'delivery step' do
    it { expect(service.call(:delivery)).to eq Delivery.all }
  end

  describe 'confirm step' do
    it { expect(service.call(:confirm)).to eq Card.first }
  end

  describe 'payment step' do
    let!(:card) { create(:card, order: order) }

    it { expect(service.call(:payment)).to eq card }
  end

  describe 'complete step' do
    it { expect(service.call(:complete)).to eq order }
  end
end
