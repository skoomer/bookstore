# frozen_string_literal: true

class BooksController < ApplicationController
  BOOKS_ON_PAGE = 12
  SHORT_TRUNCATE = 240
  BOOKS_TRUNCATE = SHORT_TRUNCATE + 1
  include Pagy::Backend

  include Filtering

  def index
    scoped_books = Books::FindBooks.new(Book.all, params).call
    Pagy::VARS[:max_items] = BOOKS_ON_PAGE
    @pagy, @books = pagy_countless(scoped_books, items: BOOKS_ON_PAGE, link_extra: 'data-remote="true"')

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
