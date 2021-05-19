# frozen_string_literal: true

class Menu < SitePrism::Section
  element :mobile_develop, 'a', text: I18n.t('partials.header.mobile_dev')
  element :photo, 'a', text: I18n.t('partials.header.photo')
  element :desing, 'a', text: I18n.t('partials.header.desing')
  element :web_develop, 'a', text: I18n.t('partials.header.web_dev')
  element :button_start, 'a', text: I18n.t('pages.index.buttons.start')
  element :my_account, 'a', text: I18n.t('partials.header.my_account')
end
