# frozen_string_literal: true

require_relative 'menu'

class BookPage < SitePrism::Page
  set_url '/books'

  element :title, 'a', text: I18n.t('partials.header.title')
  element :btn_home, 'a', text: I18n.t('partials.header.home')
  element :btn_shop, 'header', text: I18n.t('partials.header.shop')
  element :footer_orders, 'a', text: I18n.t('partials.footer.orders')
  element :footer_email, 'p', text: I18n.t('partials.footer.email')
end
