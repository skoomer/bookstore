# frozen_string_literal: true

RSpec.describe 'Book' do
  let(:book_page_detail) { BookDetail.new }
  let!(:book) { create(:book, author: author, category: category) }
  let(:author) { create(:author) }
  let(:category) { create(:category) }

  describe 'content' do
    before do
      book_page_detail.load(book: book.id)
    end

    it do
      expect(book_page_detail).to have_btn_back
      expect(book_page_detail).to have_book_name(text: book.title)
      expect(book_page_detail).to have_book_authors(text: book.author.first_name)
    end

    it do
      book_page_detail.btn_read_more.click
      expect(book_page_detail).to have_book_all_description
    end
  end
end
