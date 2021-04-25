# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book do
  let(:book_material) { ['leather', 'glossy paper', 'matte paper'] }

  let(:book) { FactoryBot.create(:book, author: author, category: category, material: book_material.sample) }
  let(:author) { FactoryBot.create(:author) }
  let(:category) { FactoryBot.create(:category) }

  describe 'create book object' do
    it 'create book' do
      expect(book).to be_truthy
    end
  end
end
