# frozen_string_literal: true

RSpec.describe CartsController do
  let!(:book) { create(:book) }
  let(:order_item_new) { build(:order_item, book: create(:book)) }
  let(:order_item) { create(:order_item) }
  let(:user) {create(:user)}
  describe 'GET #show' do
    before { get :show }

    it 'assign order_items' do
      expect(assigns(:order_items)).not_to eq nil
    end

    it 'assign discount' do
      expect(assigns(:discount)).to eq nil
    end

    context 'when status 200' do
      it { expect(response.status).to eq(200) }
      it { expect(response).to render_template :show }
    end
  end

  describe 'PUT #update' do
    before { put :update }

    context 'when update' do
      it { expect(response.status).to eq(302) }
      it { expect(response).to redirect_to cart_path }
    end
  end
  describe 'POST #update' do
    # let(:create_params) { { order_item: { book_id: book.id, quantity: 1 } } }
    # let!(:book) { create(:book) }


    it 'assign order_item' do
      # binding.pry
      patch :update , params: { id: order_item.id, order_item: order_item.attributes}
      # expect(response).to have_http_status(:found)
      expect(response).to redirect_to(cart_path)

    end

    it { expect(response).to have_http_status :ok }
  end
end
