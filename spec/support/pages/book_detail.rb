# frozen_string_literal: true

require_relative 'menu'
require_relative 'review_form'

class BookDetail < SitePrism::Page
  set_url '/books{/book}'
  element :book_name, 'h1'
  element :book_authors, 'p'
  element :book_price, 'p'
  element :btn_read_more, 'button', text: I18n.t('books.show.buttons.read_more')
  element :book_all_description, 'span'
  element :btn_back, 'a', text: I18n.t('books.show.buttons.back')
  element :my_account, 'a', text: I18n.t('partials.header.my_account')
  element :title_review, 'h4', text: I18n.t('books.show.reivew_title')
  element :title_write_review, 'h5', text: I18n.t('en.reviews.form.write_review')

  element :success_flash_message, '.alert-success', text: I18n.t('book_pages.review')
  element :failure_flash_message, '.alert-danger', text: I18n.t('book_pages.error')

  section :review_form, ReviewForm, 'form#new_review'

  expected_elements :book_name, :book_authors, :title_score, :title_write_review,
                    :book_price, :btn_read_more, :book_all_description, :btn_back, :my_account, :title_review
end
