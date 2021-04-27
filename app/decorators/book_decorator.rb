# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  TRUNCATE = 240

  delegate_all

  def book_matarial
    material.capitalize
  end

  def description_short
    description.split('.').first
  end

  def dimensions
    "H: #{height}\" x W: #{width}\" x D: #{depth}"
  end

  def author_name
    "#{author.first_name} #{author.last_name}"
  end

  def medium_description
    description[0..TRUNCATE]
  end

  def all_description
    description[(TRUNCATE.next)..]
  end

  def description_truncate?
    description.size < TRUNCATE
  end
end
