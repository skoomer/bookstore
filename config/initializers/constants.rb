module Constants
    BOOKS_ON_PAGE = 12
    PAGY_COUNT_DEFAULT = 3

    BOOK_FILTERING_ORDER = {
      'title ASC' => I18n.t('books.sort_list.title_asc'),
      'title DESC' => I18n.t('books.sort_list.title_desc'),
      'created_at DESC' => I18n.t('books.sort_list.newest_first'),
      'price ASC' => I18n.t('books.sort_list.price_asc'),
      'price DESC' => I18n.t('books.sort_list.price_desc')
    }.freeze

    SORT_LIST = [
      { type: :newest_first,  value: 'sort_list.newest_first',  sort_field: :created_at,        sort_direction: :desc },
      { type: :popular_first, value: 'sort_list.popular_first', sort_field: :order_items_count, sort_direction: :desc },
      { type: :price_asc,     value: 'sort_list.price_asc',     sort_field: :price_cents,       sort_direction: :asc  },
      { type: :price_desc,    value: 'sort_list.price_desc',    sort_field: :price_cents,       sort_direction: :desc },
      { type: :title_asc,     value: 'sort_list.title_asc',     sort_field: :title,              sort_direction: :asc  },
      { type: :title_desc,    value: 'sort_list.title_desc',    sort_field: :title,              sort_direction: :desc }
    ].freeze
  
    SORT_ITEM_DEFAULT = SORT_LIST.detect { |sort| sort[:type] == :title_asc }
  
    REGEX_LETTER_ONLY = /\A[a-zA-Z]+\z/.freeze
    REGEX_TITLE = %r{\A[a-zA-Z!#$%&'*+-\/=?^_`{|}~\s]+\z}.freeze
end
