# frozen_string_literal: true

module Books
  class FilterQuery
    BOOK_FILTERING_ORDER = {
      'title ASC' => I18n.t('books.sort_list.title_asc'),
      'title DESC' => I18n.t('books.sort_list.title_desc'),
      'created_at DESC' => I18n.t('books.sort_list.newest_first'),
      'price ASC' => I18n.t('books.sort_list.price_asc'),
      'price DESC' => I18n.t('books.sort_list.price_desc')
    }.freeze

    DEFAULT_SORT = 'title ASC'

    def call(params)
      @category_id = params[:category_id]
      @sort_by_param = params[:sort_by]

      @sort_by_param ? category_books_line.order(@sort_by_param) : category_books_line.order(DEFAULT_SORT)
    end

    def category_books_line
      Book.where(category_id: @category_id).or(Book.all)
    end
  end
end
