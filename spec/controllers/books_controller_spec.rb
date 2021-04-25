# frozen_string_literal: true

require 'pry'

RSpec.describe BooksController do
  let(:book) { FactoryBot.create(:book, author: author, category: category) }
  let(:author) { FactoryBot.create(:author) }
  let(:category) { FactoryBot.create(:category) }

  describe 'GET /index' do
    before { get :index }

    it 'return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'render index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show book ' do
    before { get :show, params: { id: book.id } }

    it 'return http success if book exists' do
      expect(response).to have_http_status(:success)
    end
  end
end
