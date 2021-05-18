# frozen_string_literal: true

class BooksController < ApplicationController
  decorates_assigned :books, :book

  def index
    @presenter = SearchPresenter.new
    @books_count = Book.count
    scoped_books = Books::FilterQuery.new(params).call

    @pagy, @books = pagy_countless(scoped_books, link_extra: 'data-remote="true"')

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end
end
