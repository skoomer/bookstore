# frozen_string_literal: true

RSpec.describe Delivery, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:time_shipping).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
  end
end
