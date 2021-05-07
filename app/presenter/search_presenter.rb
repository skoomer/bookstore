# frozen_string_literal: true

class SearchPresenter < Rectify::Presenter
  def search_books(search_title = nil)
    if Books::FilterQuery::BOOK_FILTERING_ORDER[search_title]
      return Books::FilterQuery::BOOK_FILTERING_ORDER[search_title]
    end

    Books::FilterQuery::DEFAULT_SORT || Books::FilterQuery::BOOK_FILTERING_ORDER[search_title]
  end
end
