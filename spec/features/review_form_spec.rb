# frozen_string_literal: true

RSpec.describe ReviewForm do
  let(:book_page_detail) { BookDetail.new }
  let!(:book) { create(:book) }
  let(:review) { attributes_for(:review, user_id: user.id) }
  let(:user) { create(:user) }

  context 'when create review' do
    before do
      login_as(user, scope: :user)
      book_page_detail.load(book: book.id)
    end

    it 'shows success message if review created successfully' do
      book_page_detail.review_form.review_as_book(title: review[:title], text: review[:text],
                                                  score: review[:score])
      expect(book_page_detail).to have_success_flash_message
    end

    it 'shows error message if review was not created' do
      book_page_detail.review_form.review_as_book
      expect(book_page_detail).to have_failure_flash_message
    end
  end
end
