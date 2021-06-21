# frozen_string_literal: true

require_relative 'menu'

class Home < SitePrism::Page
  set_url '/'

  element :nav_bar, 'div.navbar-header'
  element :slider, 'div#slider'
  element :button_prev, 'a.left'
  element :button_next, 'a.right'
  element :best_sellers, 'div#best_sellers'
  elements :item_best_sellers, 'div#best_sellers div.col-sm-6'
  element :footer, 'footer.navbar-inverse'

  element :title, 'a', text: I18n.t('partials.header.title')
  element :button_home, 'a', text: I18n.t('partials.header.home')
  element :button_shop, 'header', text: I18n.t('partials.header.shop')
  element :footer_orders, 'a', text: I18n.t('partials.footer.orders')
  element :footer_email, 'p', text: I18n.t('partials.footer.email')
  element :greeting, 'h2.h1', text: I18n.t('pages.index.greeting')
  element :button_start, 'a', text: I18n.t('pages.index.buttons.start')
  element :text_best_sellers, 'h3', text: I18n.t('pages.index.best')
  element :success_flash_message, 'div.alert.alert-success'
  element :failure_flash_message, 'div.alert.alert-danger'
  element :email_header, 'a#user-email'
  element :header, 'header'
  section :menu, Menu, 'li.dropdown'

  expected_elements :nav_bar, :slider, :button_prev, :button_next, :best_sellers, :item_best_sellers, :footer, :title,
                    :button_home, :button_shop, :footer_email,
                    :greeting, :button_start, :text_best_sellers, :header, :menu
end
