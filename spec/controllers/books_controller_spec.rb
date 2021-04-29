# frozen_string_literal: true

RSpec.describe BooksController do
  describe '#index' do
    let!(:books) { create_list(:book, 2) }

    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'assingns @books' do
      expect(assigns(:books)).to match_array(books)
    end
  end

  describe '#show' do
    let(:book) { create(:book) }

    before do
      get :show, params: { id: book.id }
    end

    it 'renders template' do
      expect(response).to render_template(:show)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    context 'when book not found' do
      before { get :show, params: { id: book.id.next } }

      it { is_expected.to respond_with(:not_found) }
    end
  end

  describe 'book not found' do
    let(:book) { create(:book) }

    before { get :show, params: { id: book.id.next } }

    it 'response status 404' do
      expect(response.status).to eq(404)
    end
  end
end
