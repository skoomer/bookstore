RSpec.describe BookDecorator do
    subject(:book) { build(:book).decorate }

    describe '#book_matarial' do
      let(:book_material) { book.material.capitalize }
  
      it { expect(book.book_matarial).to eq(book_material) }
    end
  
    describe '#dimensions' do
      it {
        expect(book.dimensions).to eq I18n.t('books.show.dimensions', height: book.height, width: book.width,
                                                                     depth: book.depth)
      }
    end


    describe 'description' do
      let(:length) { BookDecorator::BOOK_DESCRIPTION }
      let(:description) { book.description }
  
      it '#short_description' do
        expect(book.description_short).to eq(description.split('.').first)
      end
  
      it '#medium_description' do
        expect(book.medium_description.length).to eq(description[..length].size)
      end
  
      it '#all_description' do
        expect(book.all_description.size).to eq(description[(length + 1)..].length)
      end
  
      it '#description_less_240' do
        allow(book.description).to receive(:size) { length - 5 }
        expect(book).to be_description_truncate
      end
    end
  end
