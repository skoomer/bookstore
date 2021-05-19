# frozen_string_literal: true

module Books
  class FilterQuery
    BOOK_FILTERING_ORDER = {
      'title ASC' => I18n.t('sort_list.title_asc'),
      'title DESC' => I18n.t('sort_list.title_desc'),
      'created_at DESC' => I18n.t('sort_list.newest_first'),
      'price ASC' => I18n.t('sort_list.price_asc'),
      'price DESC' => I18n.t('sort_list.price_desc')
    }.freeze

    DEFAULT_SORT = 'title ASC'

    def initialize(params = {})
      @category_id = params[:category_id]
      @sort_by = params[:sort_by]
    end

    def call
      category_books_line.order(sorting_params)
    end

    private

    def sorting_params
      @sort_by || DEFAULT_SORT
    end

    def category_books_line
      @category_id ? Book.where(category_id: @category_id) : Book.all
    end
  end
end
