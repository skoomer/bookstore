# frozen_string_literal: true

RSpec.describe CheckoutController do
  let(:user) { create(:user, :add_address) }
  let(:step) { %i[login address delivery payment confirm complete] }

  before { allow(controller).to receive(:current_order).and_return(order) }

  describe 'PUT #show' do
    let(:order) { create(:order, user: user) }

    context 'when login step' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        put :show, params: { id: step[0] }
      end

      it { expect(order.user).to eq user }
    end
  end

  describe 'PUT #update' do
    let(:order) { create(:order, user: user) }
    let(:delivery) { create(:delivery) }
    let(:card) { attributes_for(:card) }
    let(:address_params) do
      { billing: attributes_for(:address),
        shipping: attributes_for(:address) }
    end

    context 'when address step' do
      before { put :update, params: { id: step[1], address: address_params, use_billing: true } }

      it { expect(order.user.shipping_address).not_to eq nil }

      it { expect(order.user.billing_address).not_to eq nil }
    end

    context 'when delivery step' do
      before { put :update, params: { id: step[2], order: { delivery_id: delivery.id } } }

      it { expect(order.delivery).to eq delivery }
    end

    context 'when payment step' do
      before { put :update, params: { id: step[3], card: card } }

      it { expect(order.card).not_to eq nil }
    end

    context 'when confirm step' do
      before { put :update, params: { id: step[4] } }

      it { expect(order.compleated_at).not_to eq nil }
    end
  end
end
