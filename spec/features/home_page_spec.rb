# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :feature, js: true do
  let(:home_page) { Home.new }

  describe 'content' do
    before do
      home_page.load
    end

    it { expect(home_page).to be_all_there }
    it { expect(home_page.item_best_sellers.size).to eq(4) }
  end

  describe 'menu' do
    before do
      home_page.load
    end

    it do
      within('header') { click_link(I18n.t('header.shop')) }
      expect(home_page).to have_content(I18n.t('header.mobile_dev'))
      expect(home_page).to have_content(I18n.t('header.photo'))
      expect(home_page).to have_content(I18n.t('header.desing'))
      expect(home_page).to have_content(I18n.t('header.my_account'))
    end
  end
end