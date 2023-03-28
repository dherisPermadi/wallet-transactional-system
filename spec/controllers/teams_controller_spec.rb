require 'rails_helper'

RSpec.describe Api::V1::TeamsController, type: :controller do
  context 'authorized' do
    let(:user) { create(:user) }
    let(:team) { create(:team) }

    before(:each) do
      request.session[:client_id] = user.id
      request.session[:client_type] = "User"
    end

    it "index should return 200 when it is authorized" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    context 'show team' do
      it 'should return 200' do
        get :show, params: { id: team.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context "invalid Authorization header" do
    it "returns a 403" do
      request.session[:client_id] = nil
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
