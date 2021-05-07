# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  BOOK_DESCRIPTION = 240
  delegate_all

  def book_matarial
    material.capitalize
  end

  def description_short
    description.split('.').first
  end

  def dimensions
    I18n.t('books.show.dimensions', height: height, width: width, depth: depth)
  end

  def author_name
    "#{author.first_name} #{author.last_name}"
  end

  def medium_description
    description[0..BOOK_DESCRIPTION]
  end

  def all_description
    description[(BOOK_DESCRIPTION.next)..]
  end

  def description_truncate?
    description.size < BOOK_DESCRIPTION
  end
end
