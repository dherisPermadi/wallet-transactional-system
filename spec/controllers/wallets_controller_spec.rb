require 'rails_helper'

RSpec.describe Api::V1::WalletsController, type: :controller do
  context 'authorized' do
    let(:user) {
      User.create(
        email: 'user-test@example.com',
        first_name: 'Jean',
        password: 'Password'
      )
    }
    let(:wallet) { Wallet.create(walletable_id: user.id, walletable_type: 'User') }

    before(:each) do
      request.session[:client_id] = wallet.walletable_id
      request.session[:client_type] = "User"
    end

    context 'show detail wallet' do
      it 'should return 200' do
        get :detail
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context "invalid Authorization header" do
    it "returns a 403" do
      request.session[:client_id] = nil
      get :detail
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
