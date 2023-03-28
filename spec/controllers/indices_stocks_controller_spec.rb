require 'rails_helper'

RSpec.describe Api::V1::IndicesStocksController, type: :controller do
  context 'authorized' do
    let(:team) { create(:team) }
    let(:indices_stock) { create(:indices_stock) }
    
    before(:each) do
      request.session[:client_id] = team.id
      request.session[:client_type] = "Team"
    end

    it "index should return 200 when it is authorized" do
      get :index
      expect(response).to have_http_status(:ok)
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
