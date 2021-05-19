# frozen_string_literal: true

RSpec.describe 'Books' do
  let(:book_page) { BookPage.new }
  let(:count_books) { stub_const 'Constants::BOOKS_ON_PAGE', 2 }

  describe 'content' do
    let!(:book) { create_list(:book, count_books) }

    before do
      book_page.load
    end

    it { expect(book_page).to be_all_there }
    it { expect(book_page).to be_displayed }

    it do
      book.each do |book|
        expect(book_page).to have_book_title(text: book.title)
        expect(book_page).to have_authors(text: book.author.first_name)
      end
    end
  end

  describe 'books per page' do
    before do
      create_list(:book, count_books)
      book_page.load
    end

    it "renders #{count_books} books per page" do
      expect(book_page.book_content.size).to eq(count_books)
    end
  end
end
