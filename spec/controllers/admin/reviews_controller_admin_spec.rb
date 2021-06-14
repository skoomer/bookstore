# frozen_string_literal: true

RSpec.describe Admin::ReviewsController do
  render_views
  let(:page) { Capybara::Node::Simple.new(response.body) }
  let(:current_user) { create(:admin_user) }
  let!(:review) { create(:review) }
  let(:valid_attributes) { review.attributes }

  before { sign_in current_user }

  describe 'GET index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the reviews' do
      expect(assigns(:reviews)).to include(review)
    end
  end

  describe '#status' do
    before do
      post :create, params: { review: valid_attributes }
    end

    it 'update review status' do
      expect(review).to transition_from(:waiting).to(:approved).on_event(:approved)
      expect(review).to transition_from(:waiting).to(:rejected).on_event(:rejected)
    end

    it 'status state' do
      expect(review).to have_state(:waiting)
    end
  end
end
