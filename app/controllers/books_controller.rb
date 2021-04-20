class BooksController < ApplicationController
    def index
      @books = Book.all
      search = params[:search]
      @books = @books.where("title ILIKE '%?%'", search) if search
    
      from_price = params[:from_price]
      @books = @books.where('price > ?', from_price) if from_price
    
      to_price = params[:to_price]
      @books = @books.where('price < ?', to_price) if to_price
    
      category_id = params[:category_id]
      @books = @books.where(category_id: category_id) if category_id
    
      sort_direction = params[:sort_direction] || :desc
      sort_type = params[:sort_type] || :price
      page_number = params[:page] || 0
      @books = @books.order(sort_type => sort_direction)
      

      respond_to do |format|
        format.html
        format.js
      end
    end

    def show
        @book = Book.find(params[:id])
    end

end
