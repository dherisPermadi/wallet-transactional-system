require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe "POST /login" do
    it "returns Login Successful" do
      post '/login', 
        params: { email: user.email, password: user.password }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Login Successful')
    end

    it "returns Invalid Email or Password" do
      post '/login', 
        params: { email: user.email, password: "nottherightpassword" }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to eq('Invalid Email or Password')
    end
  end

  describe "Successfully logout" do
    it "returns Logged Out" do
      delete "/logout"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Logged Out')
    end
  end
end
