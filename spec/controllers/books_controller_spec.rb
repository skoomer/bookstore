# frozen_string_literal: true

RSpec.describe BooksController do
  let(:book) { FactoryBot.create(:book, author: author, category: category) }
  let(:author) { FactoryBot.create(:author) }
  let(:category) { FactoryBot.create(:category) }

  describe 'GET /books' do
    before { get :index }

    it 'return http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /books' do
    before { get :show, params: { id: book.id } }

    it 'return http success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
