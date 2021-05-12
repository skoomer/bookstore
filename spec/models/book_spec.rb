# frozen_string_literal: true

RSpec.describe Book do
  let(:book_material) { ['leather', 'glossy paper', 'matte paper'] }

  let(:book) { FactoryBot.create(:book, author: author, category: category, material: book_material.sample) }
  let(:author) { FactoryBot.create(:author) }
  let(:category) { FactoryBot.create(:category) }

  describe 'with associations' do
    it { is_expected.to belong_to(:author).class_name(Author) }
    it { is_expected.to belong_to(:category) }
  end

  describe '#validate book' do
    it '.presence title' do
      expect(book).to validate_presence_of(:title)
    end
  end
end
