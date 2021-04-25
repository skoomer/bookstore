# frozen_string_literal: true

require_relative 'menu'

class BookPage < SitePrism::Page
  set_url '/books'
  element :book_title, 'p.title'
  element :book_price, 'p.font-16.in-gold-500'
  element :authors, 'p.lead.small'
  elements :book_content, 'div.col-xs-6.col-sm-3'

  element :title, 'a', text: I18n.t('partials.header.title')
  element :btn_home, 'a', text: I18n.t('partials.header.home')
  element :btn_shop, 'header', text: I18n.t('partials.header.shop')
  element :footer_orders, 'a', text: I18n.t('partials.footer.orders')
  element :footer_email, 'p', text: I18n.t('partials.footer.email')
end
