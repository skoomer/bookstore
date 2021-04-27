# frozen_string_literal: true

RSpec.describe BooksController do
  describe 'GET /index' do
    before { get :index }

    it 'return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'assingns' do
    let!(:books) { create_list(:book, 3) }

    before { get :index }

    it 'assingns @books' do
      expect(assigns(:books)).to eq(books.sort_by(&:title))
    end
  end

  describe 'GET show book ' do
    let(:book) { create(:book) }

    before do
      get :show, params: { id: book.id }
    end

    it { expect(response).to render_template :show }

    it 'return http success if book exists' do
      expect(response).to have_http_status(:success)
    end
  end
end
