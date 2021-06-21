# frozen_string_literal: true

RSpec.describe Checkout::CompleteService do
  subject(:service) { described_class.new(order,user) }
  let(:user) { create(:user) }

  describe 'address step' do
    let(:order) { create(:order, user: user) }

    it { expect(service.call(:address)).to eq user }
  end
# деливери будет тру =  если шипинг и билинг будут заполнены
  describe 'delivery step' do

 
    let(:order) { create(:order, :add_addresses) }
    it 'fsdfsdfds' do 
      # allow(subject).to receive(:delivery).and_return(true)
      # binding.pry
      expect(service.call(:delivery)).to eq true 
    end
    # it { expect(service.call(:delivery)).to eq true }
  end

end
