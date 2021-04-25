# frozen_string_literal: true

RSpec.describe 'BookDetail', type: :feature do
  let(:book_page_detail) { BookDetail.new }
  let(:book_material) { ['leather', 'glossy paper', 'matte paper'] }

  let!(:book) { FactoryBot.create(:book, author: author, category: category, material: book_material.sample) }
  let(:author) { FactoryBot.create(:author) }
  let(:category) { FactoryBot.create(:category) }

  describe 'content' do
    before do
      book_page_detail.load(book: book.id)
    end

    after { p(book_page_detail.elements_missing, '<====MISING ELEMENTS') }

    it {
      expect(book_page_detail).to have_btn_back
      expect(book_page_detail).to have_book_name(text: book.title)
      expect(book_page_detail).to have_book_price(text: I18n.t('books.partials.book.price', price: book.price))
      expect(book_page_detail).to have_book_authors(text: book.author.first_name)
    }

    it {
      book_page_detail.btn_read_more.click
      expect(book_page_detail).to have_book_all_description
    }
  end
end
