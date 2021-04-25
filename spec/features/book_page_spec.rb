# frozen_string_literal: true

RSpec.describe 'BookPage', type: :feature do
  let(:book_page) { BookPage.new }

  describe 'content' do
    before do
      book_page.load
    end

    it { expect(book_page).to be_all_there }
    it { expect(book_page).to be_displayed }
  end
end
