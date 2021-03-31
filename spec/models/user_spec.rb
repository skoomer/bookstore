require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    expect do
      described_class.create(email: 'goskoomer@gmail.com',
                             password: 'password')
    end.to change(described_class, :count).by(1)
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
