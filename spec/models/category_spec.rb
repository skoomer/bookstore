# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  let(:category) { FactoryBot.create(:category) }

  describe 'create objects category' do
    it 'create Photo' do
      expect(category.title).to eq('Mobile Development')
    end
  end
end
