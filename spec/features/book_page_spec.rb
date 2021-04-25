# frozen_string_literal: true

RSpec.describe 'BookPage', type: :feature do
  let(:book_page) { BookPage.new }

  describe 'content' do
    let!(:book) { create_list(:book, BooksController::BOOKS_ON_PAGE) }

    before do
      book_page.load
    end

    it { expect(book_page).to be_all_there }
    it { expect(book_page).to be_displayed }

    it {
      book.each do |book|
        expect(book_page).to have_book_title(text: book.title)
        expect(book_page).to have_book_price(text: I18n.t('books.partials.book.price', price: book.price))
        expect(book_page).to have_authors(text: book.author.first_name)
      end
    }
  end

  describe 'books per page' do
    before do
      create_list(:book, BooksController::BOOKS_ON_PAGE)
      book_page.load
    end

    it '12 books per page ' do
      expect(book_page.book_content.size).to eq BooksController::BOOKS_ON_PAGE
    end
  end
end