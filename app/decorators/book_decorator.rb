# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  BOOK_DESCRIPTION = 240

  DEFAULT_COVER_URL = 'https://www.bramstein.com/static/smashing-book-5-photo-stack.9d5d114e3e.jpg'.freeze

  decorates_association :author
  delegate :full_name, to: :author, prefix: true
  delegate_all

  def book_matarial
    material.capitalize
  end

  def book_images
    images&.drop(1)
  end
  def book_cover
    cover&.first&.image_url(:large) || DEFAULT_COVER_URL
  end

  def description_short
    description.split('.').first
  end

  def dimensions
    I18n.t('books.show.dimensions', height: height, width: width, depth: depth)
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
