# frozen_string_literal: true

RSpec.describe SearchPresenter do
  subject(:presenter) { described_class.new }

  describe '.search_books' do
    context 'when valid search' do
      let(:filter_params) { Books::FilterQuery::BOOK_FILTERING_ORDER.keys.second }

      it { expect(presenter.search_books(filter_params)).to eq Books::FilterQuery::BOOK_FILTERING_ORDER[filter_params] }
    end
  end
end
