# frozen_string_literal: true

RSpec.describe CheckoutController, type: :controller do
  let(:user) { create(:user) }
  let(:step) { %i[login address delivery payment confirm complete] }

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
end
