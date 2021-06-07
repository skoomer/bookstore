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

  # def add_to_cart
  #   book = Book.find(params[:id])
   
  #   if params[:add_to_cart]
  #     quantity = params[:add_to_cart].fetch(:quantity, 1).to_i
  #   else
  #     quantity = 1
  #   end
  #   @cart = current_user.cart
  #   @cart.add_book(book, quantity)
  #   redirect_to cart_path(:intro), notice: (I18n.t"books.add_to_cart.books_was_successfully_added_to_cart")
  # end
end
