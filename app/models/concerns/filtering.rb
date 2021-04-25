# frozen_string_literal: true

module Filtering
  DEFAULT = 'Title A-Z'
  BOOK_FILTERING_ORDER = {
    'title ASC' => 'Title A-Z',
    'title DESC' => 'Title Z-A',
    'created_at DESC' => 'Newest first',
    'price ASC' => 'Price: Low to high',
    'price DESC' => 'Price: High to low'
  }.freeze
end
