require 'rails_helper'

RSpec.describe Api::V1::StocksController, type: :controller do
  context 'authorized' do
    let(:user) { create(:user) }
    let(:indices_stock) { IndicesStock.create(name: 'NIFTY TEST') }
    let(:identifier_stock) {
      IdentifierStock.create(
        indices_stock_id: indices_stock.id,
        symbol_name: 'NIFTY TEST',
        name: 'NIFTY TEST 100'
      )
    }
    let(:stock) {
      Stock.create(
        identifier_stock_id: identifier_stock.id,
        stockable_type: 'User',
        stockable_id: user.id,
        quantity: 2,
        unit_price: 2500,
        total_price:5000
      )
    }

    before(:each) do
      request.session[:client_id] = user.id
      request.session[:client_type] = "User"
    end

    it "index should return 200 when it is authorized" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    context 'show stock' do
      it 'should return 200' do
        get :show, params: { id: stock.id }
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
