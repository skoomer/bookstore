# frozen_string_literal: true

require_relative 'menu'

class BookDetail < SitePrism::Page
  set_url '/books{/book}'
  element :book_name, 'h1'
  element :book_authors, 'p'
  element :book_price, 'p'
  element :btn_read_more, 'button', text: I18n.t('books.show.buttons.read_more')
  element :book_all_description, 'span'
  element :btn_back, 'a', text: I18n.t('books.show.buttons.back')
  element :my_account, 'a', text: I18n.t('partials.header.my_account')
end
