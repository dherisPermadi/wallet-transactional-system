module Api
  module V1
    class UsersController < ApplicationController
      before_action :must_be_authorized
      before_action :set_user, only: :show

      def index
        users = client_type.eql?('team') ? User.all : User.where.not(id: current_client)
        users = users.order(created_at: :desc)
                     .page(params[:page] || 1)
                     .per(params[:per_page] || 15)
        serializer = generate_collection_serializer(users, Lists::UserSerializer)
        json_response_page(serializer, users)
      end

      def show
        @user ? json_response(UserSerializer.new(@user)) : validate_response('Data not found!')
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
