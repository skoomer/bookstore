# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author do
  let(:author) { FactoryBot.create(:author) }

  describe 'create author object' do
    it 'create author' do
      expect(author).to be_truthy
    end
  end
end
