# frozen_string_literal: true

RSpec.describe ReviewsController do
  let(:book) { create(:book) }
  let(:user) { create(:user) }

  before { sign_in(user) }

  context 'when POST create' do
    context 'with valid review' do
      let(:params_review) { attributes_for(:review, book_id: book.id, user_id: user.id) }

      before { post :create, params: { book_id: book.id, review: params_review } }

      it 'redirect back' do
        expect(response).to have_http_status(:found)
      end

      it 'sends success flash' do
        expect(flash[:success]).to eq I18n.t('book_pages.review')
      end
    end

    context 'with invalid review' do
      let(:params_review) { attributes_for(:review, book_id: book.id, user_id: user.id, score: '') }

      before { post :create, params: { book_id: book.id, review: params_review } }

      it 'sends error flash' do
        expect(flash[:danger]).not_to be_nil
      end
    end
  end
end
