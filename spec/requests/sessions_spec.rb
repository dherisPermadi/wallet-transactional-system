require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { create(:user) }
  let!(:team) { create(:team) }

  describe "POST /login" do
    context 'User' do
      it "returns Login Successful" do
        post '/api/v1/login', 
          params: { email: user.email, password: user.password, client_type: 'user' }
          expect(response).to have_http_status(:ok)
          expect(JSON.parse(response.body)['message']).to eq('Login Successful')
      end

      it "returns Invalid Email or Password" do
        post '/api/v1/login', 
          params: { email: user.email, password: "nottherightpassword", client_type: 'user' }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to eq('Invalid Email or Password')
      end
    end

    context 'Team' do
      it "returns Login Successful" do
        post '/api/v1/login', 
          params: { email: team.email, password: team.password, client_type: 'team' }
          expect(response).to have_http_status(:ok)
          expect(JSON.parse(response.body)['message']).to eq('Login Successful')
      end

      it "returns Invalid Email or Password" do
        post '/api/v1/login', 
          params: { email: team.email, password: "nottherightpassword", client_type: 'team' }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to eq('Invalid Email or Password')
      end
    end
  end

  describe "Successfully logout" do
    it "returns Logged Out" do
      delete "/api/v1/logout"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Logged Out')
    end
  end
end
