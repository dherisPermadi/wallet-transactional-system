require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  context 'authorized' do
    let(:user) {
      User.create(
        email: 'user-test@example.com',
        first_name: 'Jean',
        password: 'Password'
      )
    }
    let(:money_transaction) {
      Transaction.create(
        sourceable_id: user.id,
        sourceable_type: 'User',
        transaction_type: 'deposit',
        amount: 5000
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

    context 'show transaction' do
      it 'should return 200' do
        get :show, params: { id: money_transaction.id }
        expect(response).to have_http_status(:ok)
      end
    end
    
    context 'create new transactions' do
      it "create should return 200" do
        post :create, params: {
          transaction: {
            sourceable_id: user.id,
            sourceable_type: "User",
            transaction_type: 'deposit',
            amount: 2000
          }
        }
        expect(response).to have_http_status(:ok)
      end

      it "create should return 403 if amount is not enough" do
        post :create, params: { 
          transaction: {
            sourceable_id: user.id,
            sourceable_type: "User",
            transaction_type: 'withdrawal',
            amount: 2000
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
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
