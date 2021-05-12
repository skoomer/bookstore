# frozen_string_literal: true

class SearchPresenter < Rectify::Presenter
  def search_books(search_title)
    Books::FilterQuery::BOOK_FILTERING_ORDER[search_title] || Books::FilterQuery::DEFAULT_SORT
  end
end
