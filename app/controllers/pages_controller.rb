# frozen_string_literal: true

class PagesController < ApplicationController
  LATEST_BOOKS_QUANTITY = 3
  def index
    @latest_books = BookDecorator.decorate_collection(Book.last(LATEST_BOOKS_QUANTITY))
    @books = Book.all
    @newest = NewestBooksQuery.call
    @top_books = TopBooksQuery.call
  end
end
