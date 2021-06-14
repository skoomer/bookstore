# frozen_string_literal: true

RSpec.describe Admin::AdminUsersController do
  render_views

  let(:page) { Capybara::Node::Simple.new(response.body) }
  let!(:current_user) { create(:admin_user) }

  before { sign_in current_user }

  describe 'GET index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the admin user' do
      expect(assigns(:admin_users)).to include(current_user)
    end
  end

  describe 'GET edit' do
    before do
      get :edit, params: { id: current_user.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the admin user' do
      expect(assigns(:admin_user)).to eq(current_user)
    end
  end
end
