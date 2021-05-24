# frozen_string_literal: true

RSpec.describe SignIn do
  let(:sign_in) { described_class.new }

  before { sign_in.load }

  it { expect(sign_in).to be_all_there }

  context 'when valid email' do
    let(:user) { create(:user) }

    before do
      sign_in.visit_and_login_as(email: user.email, password: user.password)
    end

    it 'redirects to root path' do
      expect(sign_in).to have_current_path(root_path, ignore_query: true)
    end

    it 'sets success flash message' do
      expect(sign_in).to have_success_flash_message
    end
  end

  context 'when invalid password or email' do
    before do
      sign_in.visit_and_login_as
    end

    it 'redirects to user path' do
      expect(sign_in).to have_current_path(new_user_session_path)
    end

    it 'sets failure flash message' do
      expect(sign_in).to have_failure_flash_message
    end
  end

  describe 'Click valid values' do
    before do
      sign_up.visit_and_login_as(user.email, user.password)
    end
  end
end
