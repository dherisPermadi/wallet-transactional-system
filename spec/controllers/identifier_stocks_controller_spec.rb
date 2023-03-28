require 'rails_helper'

RSpec.describe Api::V1::IdentifierStocksController, type: :controller do
  context 'authorized' do
    let(:team) { create(:team) }
    let(:indices_stock) { IndicesStock.create(name: 'NIFTY TEST') }
    let(:identifier_stock) {
      IdentifierStock.create(
        indices_stock_id: indices_stock.id,
        symbol_name: 'NIFTY TEST',
        name: 'NIFTY TEST 100'
      )
    }

    before(:each) do
      request.session[:client_id] = team.id
      request.session[:client_type] = "Team"
    end

    it "index should return 200 when it is authorized" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    context 'show identifier stock' do
      it 'should return 200' do
        get :show, params: { id: identifier_stock.id }
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
