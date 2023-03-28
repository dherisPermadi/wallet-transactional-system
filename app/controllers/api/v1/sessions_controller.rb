module Api
  module V1
    class SessionsController < ApplicationController
      before_action :set_client, only: :create

      def create
        if @client && @client.authenticate(params[:password])
          session[:client_id] = @client.id
          session[:client_type] = params['client_type']
          message_response('Login Successful')
        else
          validate_response('Invalid Email or Password')
        end
      end

      def destroy
        session[:client_id] = nil
        session[:client_type] = nil
        message_response('Logged Out')
      end

      private

      def set_client
        @client = params['client_type'].camelize.constantize.find_by(email: params[:email])
      end
    end
  end
end
