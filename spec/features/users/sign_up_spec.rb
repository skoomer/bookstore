# frozen_string_literal: true

RSpec.describe SignUp do
  let(:sign_up) { described_class.new }
  let(:user) { build(:user) }

  before { sign_up.load }

  it { expect(sign_up).to be_all_there }

  describe 'Click to Sign up button' do
    it 'sign up with valid values' do
      sign_up.visit_and_sign_up_as(user.email, user.password)
      expect(page).to have_current_path(root_path, ignore_query: true)
    end
  end
end
