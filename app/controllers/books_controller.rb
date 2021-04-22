# frozen_string_literal: true

class BooksController < ApplicationController
  BOOKS_ON_PAGE = 6
  include Filtering

  def index
    scoped_books = Books::FindBooks.new(Book.all, params).call
    @books = scoped_books.paginate(page: params[:page], per_page: BOOKS_ON_PAGE)

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
